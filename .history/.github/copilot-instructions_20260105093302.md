# GitHub Copilot Instructions

## Project Overview
This is a template repository designed for creating new projects with consistent structure and best practices. When working with this codebase or projects derived from this template, please follow the guidelines below.

## General Development Guidelines

### Code Quality & Standards
- Follow language-specific best practices and conventions
- Write clean, readable, and maintainable code
- Use meaningful variable and function names that clearly describe their purpose
- Add appropriate comments for complex logic or business rules
- Ensure consistent code formatting throughout the project

### Documentation
- Maintain up-to-date README.md with project overview, setup instructions, and usage examples
- Document public APIs and interfaces thoroughly
- Include inline comments for complex algorithms or business logic
- Update documentation when making significant changes to functionality

### Testing
- Write unit tests for new functionality
- Maintain existing test coverage when modifying code
- Use descriptive test names that explain what is being tested
- Follow the AAA pattern (Arrange, Act, Assert) for test structure
- Include both positive and negative test cases

### Security Best Practices
- Never commit sensitive information (API keys, passwords, tokens) to version control
- Use environment variables or secure configuration management for secrets
- Validate and sanitize user inputs
- Follow principle of least privilege for permissions and access
- Keep dependencies updated to avoid known vulnerabilities

### Version Control
- Write clear, descriptive commit messages using conventional commit format
- Use meaningful branch names that describe the feature or fix
- Keep commits focused and atomic (one logical change per commit)
- Avoid committing debug code, console logs, or temporary files

### Performance Considerations
- Optimize database queries and minimize N+1 query problems
- Use appropriate data structures and algorithms
- Consider caching strategies for expensive operations
- Monitor and profile performance-critical sections
- Minimize resource usage and memory leaks

## File Organization
- Follow established project structure and naming conventions
- Place files in appropriate directories based on their function
- Keep configuration files organized and well-documented
- Use consistent naming patterns across similar file types

## Dependencies & Libraries
- Prefer well-maintained, popular libraries over custom implementations
- Keep dependencies minimal and justified
- Update dependencies regularly while testing for compatibility
- Document any specific version requirements or constraints

## Error Handling
- Implement comprehensive error handling and logging
- Use appropriate error types and status codes
- Provide meaningful error messages for debugging and user feedback
- Handle edge cases gracefully
- Log errors with sufficient context for troubleshooting

## Collaboration Guidelines
- Follow existing code patterns and architectural decisions
- Discuss significant architectural changes before implementation
- Use pull requests for code review and collaboration
- Respond to code review feedback constructively
- Keep pull requests focused and reasonably sized

## Environment Specific Considerations
- Support multiple environments (development, staging, production)
- Use environment-specific configuration files
- Ensure code works across different operating systems when applicable
- Handle environment-specific dependencies and requirements

## Continuous Integration
- Ensure all tests pass before submitting changes
- Follow established CI/CD pipelines and workflows
- Address any linting or formatting issues identified by automated tools
- Verify that builds succeed in CI environment

## Template Customization Notes
When using this template for a new project:
1. Update project-specific information in README.md
2. Modify or extend these instructions based on project requirements
3. Customize GitHub workflows in `.github/workflows/` for your specific needs
4. Add language or framework-specific guidelines as needed
5. Update LICENSE file with appropriate license and copyright information

## Additional Context
- When suggesting code changes, consider the template nature of this repository
- Prefer solutions that are adaptable and configurable for different use cases
- Include examples and documentation that help future users of the template
- Consider backward compatibility when making changes to template structure

---

*These instructions should be customized based on the specific technology stack and requirements of projects using this template.*