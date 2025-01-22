# DevOps-Project

## 1. Git Repository & Version Control
### Prerequisites:
+ GitHub account
+ Git installed

### Steps:

#### Rahim:
1. Create GitHub repository:
   - Repository name: DevOps-Project
   - Description: End-to-End DevOps Implementation for a Web Application
2. Clone repository:
   ```
   git clone https://github.com/rahim-aziz/DevOps-Project.git
   ```
3. Create `index.html` with following content:
   ```
   <html>
   <head>
   <title>Top 5 Anime</title>
   </head>
   <body>
   <h1>Top 5 Anime</h1>
   <br/>
   <p>1. Attack On Titan</p>
   <p>2. Death Note</p>
   <p>3. Fullmetal Alchemist</p>
   <p>4. One Punch Man</p>
   <p>5. Demon Slayer</p>
   </body>
   </html>
   ```
4. Commit and Push Changes:
   ```
   git add *
   git commit -m "Initial commit: Addex index.html, updated README.md"
   git push origin main
   ```

#### Aliff:
1. Fork repository on GitHub:
   - Repository: https://github.com/rahim-aziz/DevOps-Project.git 
2. Clone repository to local machine:
   ```
   git clone https://github.com/aliffeimanajami/DevOps-Project.git
   ```
3. Adding images to local repository
   > aot.jpg

   > deathnote.jpg

   > fmab.jpg

   > opm.jpg

   > demonslayer.jpg

4. Adding images to `index.html`
   ```
   <html>
   <head>
   <title>Top 5 Anime</title>
   </head>
   <body>
   <h1>Top 5 Anime</h1>
   <br/>
   <p>1. Attack On Titan</p>
   <img src="./aot.jpg" width=100px height=100px/>
   <p>2. Death Note</p>
   <img src="./deathnote.jpg" width=100px height=100px/>
   <p>3. Fullmetal Alchemist: Brotherhood</p>
   <img src="./fmab.jpg" width=100px height=100px/>
   <p>4. One Punch Man</p>
   <img src="./opm.jpg" width=100px height=100px/>
   <p>5. Demon Slayer</p>
   <img src="./demonslayer.jpg" width=100px height=100px/>
   </body>
   </html>

   ```
5. Stage, commit, and push changes:
   ```
   git add *
   git commit -m "Added images"
   git push origin main
   ```
6. Create Pull Request

#### Afeef:
1. Fork repository on GitHub:
   - Repository: https://github.com/rahim-aziz/DevOps-Project.git 
2. Clone repository to local machine:
   ```
   git clone https://github.com/ryn66/DevOps-Project.git
   ```
3. Added genre to `index.html`:
   ```
   <html>
   <head>
   <title>Top 5 Anime</title>
   </head>
   <body>
   <h1>Top 5 Anime</h1>
   <br/>
   <p>1. Attack On Titan</p>
   <p>Genre: Action, Adventure, Military</p>
   <p>2. Death Note</p>
   <p>Genre: Fantasy, Detective, Thriller</p>
   <p>3. Fullmetal Alchemist</p>
   <p>Genre: Action, Adventure, Magic</p>
   <p>4. One Punch Man</p>
   <p>Genre: Action, Comedy, Violence</p>
   <p>5. Demon Slayer</p>
   <p>Genre: Action, Fantasy, Demon</p>
   </body>
   </html>
   ```
4. Stage, commit, and push changes:
   ```
   git add index.html
   git commit -m "Added genre"
   git push origin main
   ```
5. Create Pull Request

#### Thaqief:
1. Fork repository on GitHub:
   - Repository: https://github.com/rahim-aziz/DevOps-Project.git 
2. Clone repository to local machine:
   ```
   git clone https://github.com/chillgaey/DevOps-Project.git
   ```
3. Styling `index.html`:
   ```
   <html>
   <head>
   <title>Top 5 Anime</title>
   </head>
   <body style="background-color: pink">
   <center>
   <h1>Top 5 Anime</h1>
   <br/>
   <p>1. Attack On Titan</p>
   <br/>
   <p>2. Death Note</p>
   <br/>
   <p>3. Fullmetal Alchemist</p>
   <br/>
   <p>4. One Punch Man</p>
   <br/>
   <p>5. Demon Slayer</p>
   </center>
   </body>
   </html>
   ```
4. Stage, commit, and push changes:
   ```
   git add index.html
   git commit -m "Added background color, and centerize elements"
   git push origin main
   ```
5. Create Pull Request
 
#### Rahim:
1. Resolve conflict(if exist) and merge Pull Request

## 2. CI/CD Pipeline Setup
### Prerequisites:
+ Complete Step 1. Git Repository & Version Control
+ Complete Step 3. Containerization
+ Complete Step 4. AWS Deployment

### Steps:

#### Thaqief:
1. Sync upstream repository
2. Update local repository:
   ```
   git pull origin main
   ```
3. Make a GitHub workflow directory:
   ```
   mkdir -p .github/workflows/
   ```
4. Create `deploy.yml` inside `.github/workflows/` directory with following content:
   ```
   name: Deploy to AWS EC2
   on:
     push:
       branches:
         - main
   jobs:
     deploy:
       runs-on: ubuntu-latest
       steps: 
       - name: Checkout code
         uses: actions/checkout@v3
       - name: Set up SSH
         uses: webfactory/ssh-agent@v0.9.0
         with:
           ssh-private-key: ${{ secrets.EC2_SSH_KEY }}
       - name: Copy files to EC2
         run: |
           ssh -o StrictHostKeyChecking=no ec2-user@3.27.204.8 << 'EOF' 
           cd /home/ec2-user/git/DevOps-Project
           git pull origin main
           EOF
       - name: Rebuild docker image
         run: |
           ssh -o StrictHostKeyChecking=no ec2-user@3.27.204.8 << 'EOF' 
           cd /home/ec2-user/git/DevOps-Project
           docker build -t myapp .
           EOF
       - name: Restart Docker Container on EC2
         run: |
           ssh -o StrictHostKeyChecking=no ec2-user@3.27.204.8 << 'EOF' 
           docker stop Top5Anime
           docker rm Top5Anime
           docker run -d -p 80:80 --name Top5Anime myapp
           EOF
   ```
5. Stage, commit, and push changes:
   ```
   git add .github/workflows/deploy.yml
   git commit -m "Added GitHub Actions"
   git push origin main
   ```
6. Create Pull Request

#### Rahim:
1. Resolve conflict(if exist) and merge Pull Request
2. Add `EC2_SSH_KEY` to GitHub repository secrets
3. Update local repository:
   ```
   git pull origin main
   ```
4. Testing Workflow by editing `index.html`:
   ```
   <html>
   <head>
   <title>Top 5 Anime:</title>
   </head>
   <body style="background-color: pink">
   <center>
   <h1>Top 5 Anime:</h1>
   <br/>
   <p>1. Attack On Titan</p>
   <img src="./aot.jpg" width=100px height=100px/>
   <p>Genre: Action, Adventure, Military</p>
   <br/>
   <p>2. Death Note</p>
   <img src="./deathnote.jpg" width=100px height=100px/>
   <p>Genre: Fantasy, Detective, Thriller</p>
   <br/>
   <p>3. Fullmetal Alchemist</p>
   <img src="./fmab.jpg" width=100px height=100px/>
   <p>Genre: Action, Adventure, Magic</p>
   <br/>
   <p>4. One Punch Man</p>
   <img src="./opm.jpg" width=100px height=100px/>
   <p>Genre: Action, Comedy, Violence</p>
   <br/>
   <p>5. Demon Slayer</p>
   <img src="./demonslayer.jpg" width=100px height=100px/>
   <p>Genre: Action, Fantasy, Demon</p>
   </center>
   </body>
   </html>
   ```
5. Verify by accessing app on web browser:
   [Top 5 Anime](http://3.27.204.8)


## 3. Containerization
### Prerequisites:
+ Docker Desktop installed
+ Complete Step 1. Git Repository & Version Control

### Steps:

#### Aliff:
1. Sync upstream repository
2. Update local repository:
   ```
   git pull origin main
   ```
3. Create Dockerfile with following content:
   ```
   # Use a basic nginx image
   FROM nginx:latest
   # Copy local content to the nginx default location
   COPY . /usr/share/nginx/html
   # Expose port 80
   EXPOSE 80
   ```
4. Build Docker image:
   ```
   docker build -t myapp .
   ```
5. Verify working by running Docker container and opening `localhost` in web browser:
   ```
   docker run -d -p 8080:80 --name Top5Anime myapp
   ```
6. Stage, commit, and push changes:
   ```
   git add Dockerfile
   git commit -m "Added Dockerfile"
   git push origin main
   ```
7. Create Pull Request

#### Rahim:
1. Resolve conflict(if exist) and merge Pull Request

## 4. AWS Deployment
### Prerequisites:
+ AWS EC2 has been set up
+ Docker and git has been set up on AWS EC2
+ Complete Step 1. Git Repository & Version Control
+ Complete Step 3. Containerization

### Steps:

#### Rahim:
1. SSH into AWS EC2 instance:
   ```
   ssh -i devops.kp.pem ec2-user@52.90.86.85
   ```
2. Clone repository to `/home/ec2-user/git/Devops-Project`:
   ```
   git clone https://github.com/ashahmi/DevOps-Project
   ```
3. Build and run Docker image:
   ```
   docker build -t index-page .
   docker run -d -p 80:80 --name Top5Foods index-page
   ```
4. Verify by accessing app on web browser:
   [Top 5 Foods](http://52.90.86.85/)

## 5. Documentation & Monitoring
### Prerequisites:
+ Complete Step 1. Git Repository & Version Control
+ Complete Step 2. CI/CD Pipeline Setup
+ Complete Step 3. Containerization
+ Complete Step 4. AWS Deployment

### Steps;

#### Afeef:
1. Run Prometheus:
   ```
   docker run -d -p 9090:9090 prom/prometheus
   ```
2. Run grafana:
   ```
   docker run -d -p 3000:3000 grafana/grafana

   ```
3. Access Grafana at [Grafana](http://52.90.86.85:3000/)
4. Add Prometheus as data source
