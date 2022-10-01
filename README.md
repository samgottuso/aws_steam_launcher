# AWS Steam Launcher

## Overview

Write a basic framework for launching an EC2 optimized for gaming, with the initial use-case being specific City Skylines savefiles from City-Planner Plays.

Will hope to accomplish the following

V0: Basic scripting to launch/terminate EC2 instances with steam installed via PowerShell
V1: Basic RESTful framework to serve those actions from a client
V2: Incorporate all the necessary components for a specific save file.

### Setup

1. Update Go version to at least 1.16
2. Create IAM user for AWS account with access keys
    * Download the access keys in the csv file, but create a new file in ~/.aws/credentials
    * should follow the format outlined under the [Creating the Credentials File](https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html) section
3. Get specific Go modules following [these instructions](https://aws.github.io/aws-sdk-go-v2/docs/getting-started/)