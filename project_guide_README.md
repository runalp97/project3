**Full CI/CD Lifecycle Simulation — DevOps Project**

This project simulates a real-world, week-long DevOps workflow involving planning, collaboration, CI/CD pipeline creation, infrastructure provisioning, configuration management, containerization, and deployment.
It mirrors the daily activities of a DevOps engineer using tools like Jira, Slack, Git, Jenkins, Docker, Terraform, Ansible, and AWS.

**Overview:**
This project demonstrates an end-to-end CI/CD process used in modern DevOps teams:


⚪ Planning work and tracking progress using Jira


⚪ Team communication via Slack


⚪Version control & CI pipeline using Git + Jenkins


⚪Containerization using Docker


⚪Infrastructure provisioning using Terraform (AWS EC2, VPC, S3)


⚪ Configuration management using Ansible


⚪ Deployment of the app to AWS


⚪ Updating Jira and communicating deployment status via Slack



This is a complete DevOps lifecycle simulation from planning → coding → building → deploying → documentation.

**Tools & Technologies:**

DevOps & Collaboration

⚪Jira

⚪Slack

⚪Git & GitHub

⚪Jenkins

Infrastructure & Automation

⚪Terraform

⚪Ansible

⚪AWS (EC2, S3, IAM, VPC)

Containers

⚪ Docker

**What This Project Demonstrates:**

⚪ Ability to design a complete CI/CD pipeline

⚪ Understanding of team collaboration tools

⚪ Writing and executing Terraform IaC

⚪ Using Ansible to configure servers automatically

⚪ Containerizing applications using Docker

⚪ Deploying to AWS

⚪ Triggering Slack/Jira notifications

⚪ Realistic industry-style DevOps workflow

📂 **Project Architecture:**

 <img width="373" height="1024" alt="image" src="https://github.com/user-attachments/assets/b04c1cf0-66a8-4d15-bb7e-ac623d7791ef" />
 

**📅 Day-by-Day Implementation Flow:**

📌 Monday – Planning & Setup

⚪ Logged into Jira, reviewed assigned task and acceptance criteria

⚪ Synced with team using Slack

⚪ Created a Jenkins Pipeline connected to GitHub

⚪ Wrote a Jenkinsfile with Build → Test → Package → Deploy stages

⚪ Built a Docker container using Dockerfile


📌 Tuesday – Version Control & CI Setup

⚪ Created GitHub repository and pushed all project files

⚪ Configured Jenkins SCM triggers (webhook or poll SCM)

⚪ Started writing Terraform code for AWS resources

    ⚪EC2

    ⚪VPC

    ⚪S3


📌 Wednesday – Provision Infrastructure

Executed Terraform commands:

<img width="470" height="124" alt="image" src="https://github.com/user-attachments/assets/dd3d0643-b5e5-417b-bca9-5789670611b2" />

⚪ Terraform provisioned EC2, VPC, S3

⚪ Connected to EC2 instance via SSH

⚪ Verified server accessibility

📌 Thursday – Configuration Management

⚪ Wrote Ansible playbooks to configure EC2 instance

    ⚪ Installed app dependencies (e.g., Nginx, Node.js/Python)

    ⚪ Copied configuration files

⚪ Ran Ansible to configure EC2

⚪ Pushed final updates to GitHub

📌 Friday – Build, Push & Deploy

⚪ Built Docker image and pushed it to AWS ECR

⚪ Jenkins pipeline pulls Docker image from ECR

⚪ Deployment to AWS (EC2/ECS)

⚪ Verified application running using public IP or load balancer

⚪ Updated Jira ticket to Done

⚪ Posted deployment update on Slack


🚀 Key Outcomes

⚪ Gained practical exposure to complete DevOps lifecycle

⚪ Learned how to coordinate tasks across Jira, Slack, Git, Jenkins

⚪ Created an automated CI/CD pipeline

⚪ Built infrastructure using Terraform

⚪ Configured servers using Ansible

⚪ Containerized and deployed application on AWS


**📸 Screenshots:**

⚪ Pipeline Screenshot

<img width="940" height="454" alt="image" src="https://github.com/user-attachments/assets/0162cfde-05a8-45f0-970e-1ef02aa173e6" />

⚪ Terraform Infra Screenshot

<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/31bfdd6f-ac51-460b-90f4-fd23752a558c" />

⚪ Ansible Run Screenshot:

<img width="940" height="369" alt="image" src="https://github.com/user-attachments/assets/0cbc3b67-8964-4869-9b82-bd7fa2ff8f2d" />

<img width="940" height="527" alt="image" src="https://github.com/user-attachments/assets/fcefcd9c-2e15-40a3-9791-66b3e955708e" />

<img width="940" height="395" alt="image" src="https://github.com/user-attachments/assets/9de300e8-848d-47bb-9b4e-2d1b2991a0ee" />

⚪ Jira & Slack Notification:

<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/08b1b3c5-6606-4b14-afbe-6c3f027b9449" />

<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/6290406c-e4d7-41d5-8a25-e982a5551c1d" />

<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/f1426a4d-ced0-4104-b1bd-667b54ea0cf5" />





 🧪 How to Run: 
 
⚪**This is the part A of the project where i did tasks (1 - 4), remaining task (5) is in the part B of this project **

1️⃣ Start the Project

•	Open Jira and review the assigned task.

•	Understand the requirements, acceptance criteria, and timeline.

•	Join the project Slack channel and align with your team.
________________________________________
2️⃣ Set Up CI/CD Pipeline

•	Create a Jenkins pipeline job.

•	Connect Jenkins with the GitHub repository.

•	Add a Jenkinsfile containing build, test, package, and deployment stages.

•	Make sure each code push triggers the pipeline automatically.

________________________________________
3️⃣ Prepare Application & Code Repository

•	Build the sample application and containerize it using a Dockerfile.

•	Upload application code, Dockerfile, Jenkinsfile, Terraform files, and Ansible playbooks to GitHub.

•	Maintain meaningful commit messages and a clean folder structure.

________________________________________
4️⃣ Provision Cloud Infrastructure

•	Use Terraform to automatically create the required AWS resources such as:

o	EC2 Instance
o	VPC
o	Security Groups
o	Networking Components

•	After provisioning, collect the EC2 public IP to confirm infrastructure is ready.

________________________________________
5️⃣ Configure Servers

•	Use Ansible to automate server setup:

o	Install necessary packages (Docker, Nginx, runtime dependencies).
o	Prepare the environment for deployment.

•	Ensure the instance is reachable and ready for the application.
________________________________________
6️⃣ Build & Push Application Image

•	Build the Docker image of the application.

•	Push the image to AWS ECR so Jenkins can pull it during deployment.

•	Verify that the image is available in the ECR repository.

________________________________________
7️⃣ Execute Full Jenkins Pipeline

•	Trigger the Jenkins pipeline or let it trigger automatically via GitHub webhook.

•	The pipeline will:
o	Pull the latest code
o	Build and package the application
o	Push the Docker image to ECR
o	Deploy it to the configured EC2 instance using Ansible

•	Monitor each stage from the Jenkins dashboard.

________________________________________
8️⃣ Access the Deployed Application

•	Once deployment succeeds, open the application in your browser using:
EC2 Public IP or Load Balancer URL

•	Confirm the application is running as expected.
________________________________________
9️⃣ Close the Project

•	Mark the Jira ticket as Resolved/Done.

•	Leave a comment summarizing the work completed.

•	Notify the team on Slack:
“Deployment completed successfully.”

   













