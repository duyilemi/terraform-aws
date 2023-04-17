<div align="center">

  <img src="https://th.bing.com/th/id/OIP.QbM4V96xdZOV88Hy2nSLlAHaHZ?pid=ImgDet&rs=1" alt="logo" width="200" height="auto" />
  <h1>Configuration Management With Terraform</h1>
  
  <p>
    Configuration and state management of a web application infrastructure/stacks on AWS 
  </p>
  
  
<!-- Badges -->
<p>
  <a href="https://github.com/duyilemi/terraform-aws/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/duyilemi/terraform-aws" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/duyilemi/terraform-aws" alt="last update" />
  </a>
  <a href="https://github.com/duyilemi/terraform-aws/network/members">
    <img src="https://img.shields.io/github/forks/duyilemi/terraform-aws" alt="forks" />
  </a>
  <a href="https://github.com/duyilemi/terraform-aws/stargazers">
    <img src="https://img.shields.io/github/stars/duyilemi/terraform-aws" alt="stars" />
  </a>
  <a href="https://github.com/duyilemi/terraform-aws/issues/">
    <img src="https://img.shields.io/github/issues/duyilemi/terraform-aws" alt="open issues" />
  </a>
  <a href="https://github.com/duyilemi/terraform-aws/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/duyilemi/terraform-aws.svg" alt="license" />
  </a>
</p>
   
<h4>
    <!-- <a href="https://github.com/duyilemi/terraform-aws/">View Demo</a>
  <span> · </span> -->
    <a href="https://github.com/duyilemi/terraform-aws">Documentation</a>
  <span> · </span>
    <a href="https://github.com/duyilemi/terraform-aws/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/duyilemi/terraform-aws/issues/">Request Feature</a>
  </h4>
</div>

<br />

<!-- Table of Contents -->

# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
  <!-- - [Screenshots](#camera-screenshots) -->
  - [Tech Stack](#space_invader-tech-stack)
  - [Environment Variables](#key-environment-variables)
- [Getting Started](#toolbox-getting-started)
  - [Prerequisites](#bangbang-prerequisites)
  - [Installation](#gear-installation)
  - [Running Tests](#test_tube-running-tests)
  - [Run Locally](#running-run-locally)
- [Usage](#eyes-usage)
- [Contributing](#wave-contributing)
  - [Code of Conduct](#scroll-code-of-conduct)
- [FAQ](#grey_question-faq)
- [License](#warning-license)
- [Contact](#handshake-contact)
- [Acknowledgements](#gem-acknowledgements)

<!-- About the Project -->

## :star2: About the Project

<!-- Screenshots -->

### :camera: Screenshots

<div align="center">
  <img src="readme-assets/Screenshot (106).png" alt="screenshot" />
</div>

<!-- TechStack -->

### :space_invader: Tech Stack

<details>
<summary>Database</summary>
  <ul>
    <li><a href="#">AWS S3</a></li>
  </ul>
</details>

<details>
<summary>DevOps</summary>
  <ul>
    <li><a href="https://developer.hashicorp.com/terraform/downloads">Terraform</a></li>
    <li><a href="#">AWS CLI</a></li>
    <li><a href="#">AWS IAM user</a></li>
  </ul>
</details>

<!-- Env Variables -->

### :key: Environment Variables

Use AWS IAM user for better security

<!-- Getting Started -->

## :toolbox: Getting Started

<!-- Prerequisites -->

### :bangbang: Prerequisites

This project uses Terraform as infrastructure as code tool, AWS account, AWS S3 for for code repository and AWS IAM user.

<!-- Installation -->

### :gear: Installation

## on Windows PC

```bash
 choco install terraform
```

```bash
 choco install awscli
```

<!-- Run Locally -->

### :running: Run Locally

Clone the project

```bash
  git clone https://github.com/duyilemi/terraform-aws.git
```

Go to the project directory

```bash
  cd terraform-aws
```

Change AWS S3 url

create a folder in AWS S3 bucket, edit the url in backend.tf and changed the url to yours(before "/backend")

Initialize backend

```bash
  terraform init
```

Format the code properly

```bash
  terraform fmt
```

Validate

```bash
  terraform validate
```

Plan Changes

```bash
  terraform plan
```

Apply Changes on AWS

```bash
  terraform apply
```

## :wave: Contributing

<a href="https://github.com/duyilemi/terraform-aws/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=duyilemi/terraform-aws" />
</a>

Contributions are always welcome!

See `contributing.md` for ways to get started.

<!-- Code of Conduct -->

### :scroll: Code of Conduct

Please read the [Code of Conduct](https://github.com/duyilemi/terraform-aws/blob/master/CODE_OF_CONDUCT.md)

<!-- FAQ -->

## :grey_question: FAQ

- Question 1

  - Answer 1

- Question 2

  - Answer 2

<!-- License -->

## :warning: License

Distributed under the no License. See LICENSE.txt for more information.

<!-- Contact -->

## :handshake: Contact

Project Link: [https://github.com/duyilemi/terraform-aws](https://github.com/duyilemi/terraform-aws)
