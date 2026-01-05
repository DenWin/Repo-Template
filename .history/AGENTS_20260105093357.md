# AI Coding Agents Instructions

## Overview
This document provides guidelines for AI coding agents (including Codex, GitHub Copilot, and other AI assistants) when working with this template repository or projects derived from it. These instructions ensure consistent, high-quality code generation and modifications that align with best practices.

## Code Generation Guidelines

### Language & Framework Awareness
- Detect the primary programming language(s) and frameworks from project context
- Apply language-specific conventions and best practices automatically
- Use appropriate design patterns for the detected technology stack
- Follow established project structure and naming conventions
- Respect existing code style and formatting patterns

### Code Quality Standards
- Generate clean, readable, and maintainable code
- Use descriptive variable and function names that clearly express intent
- Add meaningful comments for complex logic, algorithms, or business rules
- Implement proper error handling and input validation
- Follow SOLID principles and other relevant design principles
- Ensure generated code is testable and follows dependency injection patterns where applicable

### Security Considerations
- Never generate code that includes hardcoded secrets, API keys, or sensitive data
- Implement proper input validation and sanitization
- Use parameterized queries for database operations
- Apply principle of least privilege in access control implementations
- Follow secure coding practices for the target language/framework
- Generate code that prevents common vulnerabilities (SQL injection, XSS, etc.)

## File and Structure Management

### Project Organization
- Respect existing directory structure and file organization patterns
- Place new files in appropriate locations based on their function and type
- Follow established naming conventions for files, classes, and modules
- Maintain consistency with existing architectural decisions
- Create supporting files (tests, documentation) alongside main implementations

### Configuration Management
- Generate environment-specific configuration files when needed
- Use appropriate configuration management patterns for the target platform
- Separate configuration from code implementation
- Document configuration options and their purposes
- Provide sensible defaults while allowing customization

## Testing and Quality Assurance

### Test Generation
- Generate comprehensive unit tests for new functionality
- Follow established testing frameworks and patterns in the project
- Use descriptive test names that explain the behavior being tested
- Implement both positive and negative test cases
- Include edge cases and boundary condition tests
- Follow AAA (Arrange, Act, Assert) or similar testing patterns

### Code Coverage
- Aim for high test coverage on new code
- Generate tests for both happy path and error scenarios
- Include integration tests where appropriate
- Test public interfaces thoroughly
- Ensure generated code is testable and mock-friendly

## Documentation and Comments

### Code Documentation
- Generate inline documentation for public APIs and interfaces
- Include JSDoc, XML documentation comments, or language-appropriate formats
- Document complex algorithms and business logic
- Explain non-obvious design decisions in comments
- Keep documentation concise but comprehensive

### README and Project Documentation
- Update or generate README.md sections as needed
- Include setup instructions for new components
- Document dependencies and requirements
- Provide usage examples for new features
- Maintain consistency with existing documentation style

## Version Control Integration

### Commit and Change Management
- Generate code that integrates cleanly with existing codebase
- Avoid unnecessary changes to unrelated files
- Respect existing formatting and style to minimize diffs
- Consider backwards compatibility when modifying existing interfaces
- Generate code that passes existing CI/CD checks

### Dependency Management
- Use existing dependency management tools and patterns
- Prefer dependencies already present in the project
- Choose well-maintained, popular libraries for new dependencies
- Document new dependencies and their purposes
- Consider security implications of new dependencies

## Performance and Efficiency

### Code Optimization
- Generate efficient algorithms and data structures
- Avoid unnecessary computations and resource usage
- Implement appropriate caching strategies where beneficial
- Consider memory usage and potential leaks
- Use async/await patterns appropriately for I/O operations

### Scalability Considerations
- Design generated code to handle growth and increased load
- Implement proper database query optimization
- Use appropriate design patterns for scalability
- Consider resource pooling and connection management
- Plan for horizontal and vertical scaling scenarios

## Template-Specific Guidelines

### Adaptability and Reusability
- Generate code that is adaptable across different use cases
- Create configurable components where appropriate
- Avoid hard-coding values that should be configurable
- Design for extensibility and customization
- Consider the template nature when making architectural decisions

### Framework Integration
- Integrate seamlessly with existing project frameworks
- Follow framework-specific best practices and conventions
- Use framework-provided features appropriately
- Maintain compatibility with framework versions used in the project
- Leverage framework tooling and utilities

## Error Handling and Logging

### Exception Management
- Implement comprehensive error handling strategies
- Use appropriate exception types for different error conditions
- Provide meaningful error messages for debugging and user feedback
- Log errors with sufficient context for troubleshooting
- Handle both expected and unexpected error scenarios gracefully

### Logging Practices
- Use established logging frameworks and patterns
- Implement appropriate log levels (debug, info, warn, error)
- Include relevant context in log messages
- Avoid logging sensitive information
- Follow structured logging practices where applicable

## Agent Behavior Guidelines

### Context Awareness
- Analyze existing codebase patterns before generating new code
- Respect established architectural decisions and patterns
- Consider the broader project context when making implementation choices
- Maintain consistency with existing code style and structure
- Adapt to project-specific conventions and requirements

### Incremental Development
- Make focused, atomic changes rather than large sweeping modifications
- Build upon existing functionality rather than replacing unnecessarily
- Test generated code incrementally during development
- Provide clear explanations for generated code and design decisions
- Iterate based on feedback and testing results

## Quality Gates

### Pre-Generation Checklist
- [ ] Understand the project structure and existing patterns
- [ ] Identify the target programming language and frameworks
- [ ] Review existing code style and conventions
- [ ] Consider security implications of proposed changes
- [ ] Plan for appropriate testing coverage

### Post-Generation Validation
- [ ] Verify generated code compiles/runs without errors
- [ ] Ensure all tests pass (existing and newly generated)
- [ ] Check that code follows established patterns and conventions
- [ ] Validate that security best practices are implemented
- [ ] Confirm documentation is complete and accurate

---

*These instructions should be customized based on the specific technology stack and requirements of projects using this template. Agents should adapt these guidelines to the specific context and requirements of each project.*