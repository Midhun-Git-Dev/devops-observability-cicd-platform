## Project Overview

**End-to-End DevOps CI/CD Pipeline** for a Dockerized JSP-based web application using **Jenkins**, **SonarQube**, **Docker**, and **AWS EC2**.

This project demonstrates a complete, automated, production-like deployment workflow — from code commit to live public application.

## Problem Statement

Manual builds, testing, and deployments are error-prone, slow, and inconsistent.  
Modern teams need **automated pipelines** that enforce quality, ensure security, and enable fast, reliable releases.

This project delivers a **fully automated CI/CD pipeline** with code quality gates, containerization, and cloud hosting.

## Objectives

- Automate build, test, quality analysis, and deployment
- Enforce code quality using SonarQube
- Containerize the application with Docker
- Deploy and serve the app on AWS EC2
- Simulate a real-world production DevOps pipeline

## Tech Stack

| Category              | Tools & Technologies                  |
|-----------------------|---------------------------------------|
| Version Control       | Git, GitHub                           |
| CI/CD                 | Jenkins                               |
| Build Tool            | Maven                                 |
| Code Quality          | SonarQube                             |
| Containerization      | Docker                                |
| Cloud Provider        | AWS EC2                               |
| Web Server            | Apache Tomcat                         |
| OS                    | Ubuntu Linux                          |
| Application           | JSP, HTML5, CSS3, JavaScript          |
| Scripting             | Shell (Bash)                          |

## Architecture & Workflow

1. Developer pushes code to **GitHub**
2. **Jenkins** detects commit → triggers pipeline
3. **Maven** builds the WAR file
4. **SonarQube** performs static code analysis + quality gate
5. **Docker** builds production-ready image
6. Docker container is deployed to **AWS EC2**
7. Application served publicly via Tomcat

**Pipeline Stages**:
- Checkout
- Maven Build
- SonarQube Scan
- Quality Gate
- Docker Build & Push
- Deploy to EC2

## Key Features of the Application

- Sticky navbar with search, cart & auth
- Hero banner with promotional overlay
- Scrollable category section
- Modern product cards (hover effects, discounts, ratings, add-to-cart)
- Deals of the Day with countdown timer
- Responsive design (mobile/tablet/desktop)
- Clean footer with links & social icons
- JSP structure ready for backend integration

## Deployment Strategy

- WAR packaged into Tomcat-based Docker image
- Container runs on AWS EC2 (public port 8085 → 8080)
- Supports rolling updates via container restart
- Security Groups restrict access
- No hardcoded secrets

## Challenges & Solutions

| Challenge                     | Solution                                      |
|-------------------------------|-----------------------------------------------|
| Jenkins performance issues    | Upgraded EC2 instance type                    |
| SonarQube connection failures | Correct server URL + webhook configuration    |
| Quality gate timeouts         | Increased timeout & optimized scan rules      |
| Docker port conflicts         | Automated container stop/remove in pipeline   |
| Pipeline instability          | Added retry logic, detailed logging           |

## Results & Impact

- **Fully automated** production-grade pipeline
- Deployment time reduced significantly
- Zero manual errors
- Enforced code quality & security
- Live, scalable app on AWS
- Real-world DevOps simulation for portfolio

## Future Enhancements

- Kubernetes orchestration
- Terraform IaC
- Trivy / Snyk security scanning
- Notification integrations (Slack/Teams)
- Multi-stage environments (Dev/Staging/Prod)
- Auto-scaling & ALB
- Prometheus + Grafana monitoring

## Live Demo

🌐 **Live Application**: [http://54.226.230.216:8085/](http://54.226.230.216:8085/)
