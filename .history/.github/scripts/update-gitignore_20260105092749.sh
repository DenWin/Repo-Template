#!/usr/bin/env bash
set -euo pipefail

# Generates/updates .gitignore using:
# - GitHub repo language stats (REST /languages)
# - Marker-file framework detection
# - Toptal gitignore API templates
#
# Outputs:
# - sets GitHub Actions output "changed" to true/false

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

OUT_FILE=".gitignore"
TMP_FILE=".gitignore.new"

# ---------- helpers ----------
gha_out() {
  # GitHub Actions output helper (works even if not running in Actions)
  local key="$1" val="$2"
  if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
    echo "${key}=${val}" >> "$GITHUB_OUTPUT"
  fi
}

have_file() { [[ -e "$1" ]]; }

# Normalize a few GitHub language names to Toptal template names.
# Toptal template names are case-insensitive, but keep canonical-ish names.
map_language_to_template() {
  local lang="$1"
  case "$lang" in
    "JavaScript") echo "JavaScript" ;;
    "TypeScript") echo "Node" ;;          # Node template covers common Node tooling output
    "Python") echo "Python" ;;
    "Go") echo "Go" ;;
    "Rust") echo "Rust" ;;
    "Java") echo "Java" ;;
    "Kotlin") echo "Kotlin" ;;
    "C#") echo "VisualStudio" ;;
    "C++") echo "C++" ;;
    "C") echo "C" ;;
    "PHP") echo "PHP" ;;
    "Ruby") echo "Ruby" ;;
    "Swift") echo "Swift" ;;
    "Dart") echo "Dart" ;;
    "Shell") echo "Shell" ;;
    "Dockerfile") echo "Docker" ;;
    *) echo "" ;;
  esac
}

# Add templates uniquely (case-insensitive compare, keep insertion order)
add_template() {
  local t="$1"
  [[ -z "$t" ]] && return 0
  local existing
  for existing in "${TEMPLATES[@]:-}"; do
    if [[ "${existing,,}" == "${t,,}" ]]; then
      return 0
    fi
  done
  TEMPLATES+=("$t")
}

# ---------- base templates ----------
TEMPLATES=()
add_template "Global"
add_template "macOS"
add_template "Windows"
add_template "Linux"
add_template "VisualStudioCode"

# ---------- framework marker detection (explicit, explainable) ----------
# These are additive “hints”; the GitHub /languages endpoint is the primary signal.
if have_file "package.json"; then add_template "Node"; fi
if have_file "pnpm-lock.yaml"; then add_template "Node"; fi
if have_file "yarn.lock"; then add_template "Node"; fi
if have_file "requirements.txt" || have_file "pyproject.toml" || have_file "Pipfile"; then add_template "Python"; fi
if have_file "go.mod"; then add_template "Go"; fi
if have_file "Cargo.toml"; then add_template "Rust"; fi
if have_file "pom.xml" || have_file "build.gradle" || have_file "build.gradle.kts"; then add_template "Java"; fi
if have_file ".sln" || ls *.sln >/dev/null 2>&1; then add_template "VisualStudio"; fi
if have_file "composer.json"; then add_template "PHP"; fi
if have_file "Gemfile"; then add_template "Ruby"; fi
if have_file "Dockerfile" || have_file "docker-compose.yml" || have_file "compose.yaml"; then add_template "Docker"; fi

# ---------- language detection via GitHub API ----------
# Uses the repository language breakdown that GitHub computes.
# Endpoint: GET /repos/{owner}/{repo}/languages :contentReference[oaicite:3]{index=3}
LANG_JSON=""
if [[ -n "${GITHUB_TOKEN:-}" && -n "${GITHUB_REPOSITORY:-}" ]]; then
  LANG_JSON="$(curl -fsSL \
    -H "Authorization: Bearer ${GITHUB_TOKEN}" \
    -H "Accept: application/vnd.github+json" \
    "https://api.github.com/repos/${GITHUB_REPOSITORY}/languages" || true)"
fi

if [[ -n "$LANG_JSON" ]]; then
  # Convert {"Lang": bytes, ...} into "Lang bytes" lines, sort by bytes desc, take top 5.
  # ubuntu-latest includes jq.
  while read -r lang; do
    t="$(map_language_to_template "$lang")"
    add_template "$t"
  done < <(printf '%s' "$LANG_JSON" \
      | jq -r 'to_entries | sort_by(.value) | reverse | .[0:5] | .[].key')
fi

# Safety: if still only base templates exist, keep as-is.
# (Still fine; it will generate a minimal, OS/editor-oriented .gitignore.)

# ---------- call toptal ----------
CSV="$(IFS=,; echo "${TEMPLATES[*]}")"

echo "Templates: $CSV"
curl -fsSL "https://www.toptal.com/developers/gitignore/api/${CSV}" -o "$TMP_FILE"

# Normalize line endings just in case
perl -pi -e 's/\r\n/\n/g' "$TMP_FILE"

# ---------- avoid unnecessary changes ----------
if [[ -f "$OUT_FILE" ]]; then
  perl -pi -e 's/\r\n/\n/g' "$OUT_FILE"
  if cmp -s "$TMP_FILE" "$OUT_FILE"; then
    rm -f "$TMP_FILE"
    echo "No changes to .gitignore"
    gha_out "changed" "false"
    exit 0
  fi
fi

mv -f "$TMP_FILE" "$OUT_FILE"
echo ".gitignore updated"
gha_out "changed" "true"
