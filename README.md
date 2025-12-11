# Goober: Cloud-Native Trash Can Finder 🗑️📍

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestrated-blue)
![MERN Stack](https://img.shields.io/badge/Stack-MERN-green)

A full-stack distributed application designed to help communities locate waste disposal points efficiently. Refactored from a monolithic MERN stack into a **Cloud-Native Microservices Architecture** to demonstrate DevOps best practices, container orchestration, and automated CI/CD pipelines.

---

## 🏗️ System Architecture

This project decouples the legacy codebase into isolated services, managed by a reverse proxy and orchestrated via Kubernetes.

```mermaid
graph TD;
    Client[Browser / Client] -->|HTTP:80| Nginx[Nginx Reverse Proxy];
    Nginx -->|/api| Backend[Node.js API];
    Nginx -->|/*| Frontend[React UI];
    Backend -->|TCP:27017| Database[(MongoDB StatefulSet)];
    Backend -->|Persistent Volume| Storage[PV / Data Volume];

