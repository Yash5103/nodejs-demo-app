# 🚀 Node.js CI/CD Pipeline with GitHub Actions & Docker

This project demonstrates how to automate the build and deployment process of a Node.js application using **GitHub Actions** and **DockerHub**.

---

## 📦 Project Overview

- Build a simple Node.js app
- Use Docker to containerize the application
- Automate CI/CD workflow with GitHub Actions
- Push the Docker image to DockerHub on every push to the `main` branch

---

## 🧰 Tech Stack

| Tool         | Purpose                        |
|--------------|--------------------------------|
| Node.js      | Backend application runtime    |
| Docker       | Containerization               |
| GitHub Actions | CI/CD automation             |
| DockerHub    | Image registry                 |

---

## 🗂️ Folder Structure

nodejs-demo-app/ ├── Dockerfile ├── index.js ├── package.json └── .github/ └── workflows/ └── main.yml

yaml
Copy
Edit

---

## ⚙️ GitHub Actions Workflow

### 📍 Trigger
The workflow is triggered on push to the `main` branch.

### 🛠️ Actions
- Checkout source code
- Login to DockerHub
- Build and push Docker image

### 🧾 main.yml

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: 📥 Checkout Code
        uses: actions/checkout@v3

      - name: 🛠 Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: 🔐 DockerHub Login
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: 📦 Build & Push Docker Image
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ secrets.DOCKER_USERNAME }}/nodejs-app:latest
🔐 GitHub Secrets Setup
Go to your GitHub repository → Settings → Secrets and variables → Actions → New repository secret:

Secret Name	Value
DOCKER_USERNAME	Your DockerHub username
DOCKER_PASSWORD	Your DockerHub password
🐳 Docker Commands Used
bash
Copy
Edit
# Build the Docker image
docker build -t nodejs-app .

# Tag the image
docker tag nodejs-app <your-dockerhub-username>/nodejs-app

# Push to DockerHub
docker push <your-dockerhub-username>/nodejs-app
🧪 How to Test
Make changes in the code and push to the main branch.

GitHub Actions will automatically build and push the updated image to DockerHub.

You can verify the updated image on DockerHub.

📄 License
This project is licensed under the MIT License.

🙌 Acknowledgements
Thanks to the open-source community and GitHub Actions team for the automation magic ✨

yaml
Copy
Edit

---

### 📤 Steps to Add This `README.md` to GitHub

1. Go to your project directory:
   ```bash
   cd ~/nodejs-demo-app
Create or overwrite README.md:

bash
Copy
Edit
nano README.md
Paste the content above → save using:

Ctrl + O, Enter (to save)

Ctrl + X (to exit)

Commit and push:

bash
Copy
Edit
git add README.md
git commit -m "Add polished project README"
git push origin main
