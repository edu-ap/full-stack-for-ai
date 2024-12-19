\newpage
# Chapter 20: Full-Stack AI Application

This chapter serves as a final project tutorial, guiding you through building and deploying a full-stack application. The project combines essential concepts learned in previous chapters: creating a Node.js app that handles Stripe subscriptions and deploying it on the most cost-effective AWS service.

## Project Overview

### Application Features
1. **User Authentication**: Secure login for customers.
2. **Stripe Subscription Integration**: Users can sign up for recurring subscriptions.
3. **Deployment**: The app is hosted on AWS using a cost-effective serverless architecture.

### Prerequisites
1. A Stripe account with a configured subscription product.
2. An AWS account with permissions to deploy Lambda functions and API Gateway.
3. Basic knowledge of Node.js, Express, and Stripe.

## Step 1: Set Up the Node.js Application

### Initialize the Project
1. Create a new directory and navigate to it:
   ```bash
   mkdir full-stack-app && cd full-stack-app
   ```
2. Initialize a Node.js project:
   ```bash
   npm init -y
   ```
3. Install necessary dependencies:
   ```bash
   npm install express stripe serverless dotenv
   ```

### Write the Application Code
1. Create an `.env` file for environment variables:
   ```
   STRIPE_SECRET_KEY=your-stripe-secret-key
   ```
2. Create an `index.js` file with the following content:
   ```javascript
   const express = require('express');
   const Stripe = require('stripe');
   const dotenv = require('dotenv');

   dotenv.config();
   const stripe = Stripe(process.env.STRIPE_SECRET_KEY);

   const app = express();
   app.use(express.json());

   app.post('/create-subscription', async (req, res) => {
       const { email, paymentMethodId, priceId } = req.body;

       try {
           // Create a customer
           const customer = await stripe.customers.create({
               email,
               payment_method: paymentMethodId,
               invoice_settings: { default_payment_method: paymentMethodId }
           });

           // Create a subscription
           const subscription = await stripe.subscriptions.create({
               customer: customer.id,
               items: [{ price: priceId }],
               expand: ['latest_invoice.payment_intent']
           });

           res.json({ subscriptionId: subscription.id });
       } catch (error) {
           res.status(500).send({ error: error.message });
       }
   });

   const port = 3000;
   app.listen(port, () => console.log(`Server running on port ${port}`));
   ```

## Step 2: Test Locally

1. Start the server:
   ```bash
   node index.js
   ```
2. Test the `/create-subscription` endpoint using Postman or cURL:
   ```bash
   curl -X POST http://localhost:3000/create-subscription \
        -H "Content-Type: application/json" \
        -d '{"email": "test@example.com", "paymentMethodId": "pm_card_visa", "priceId": "price_xxxx"}'
   ```

## Step 3: Deploy to AWS Using Serverless Framework

### Install Serverless Framework
1. Install Serverless globally:
   ```bash
   npm install -g serverless
   ```
2. Initialize a Serverless project:
   ```bash
   serverless create --template aws-nodejs --path serverless-app
   cd serverless-app
   ```

### Configure Serverless
1. Update the `serverless.yml` file:
   ```yaml
   service: full-stack-app

   provider:
     name: aws
     runtime: nodejs14.x
     environment:
       STRIPE_SECRET_KEY: ${env:STRIPE_SECRET_KEY}

   functions:
     createSubscription:
       handler: index.createSubscription
       events:
         - http:
             path: create-subscription
             method: post
   ```
2. Move `index.js` into the `serverless-app` directory.

### Deploy to AWS
1. Deploy the app:
   ```bash
   serverless deploy
   ```
2. Note the deployed endpoint URL from the output.

## Step 4: Verify and Test

1. Use Postman or cURL to test the live endpoint:
   ```bash
   curl -X POST <endpoint-url>/create-subscription \
        -H "Content-Type: application/json" \
        -d '{"email": "test@example.com", "paymentMethodId": "pm_card_visa", "priceId": "price_xxxx"}'
   ```
2. Check Stripe Dashboard to confirm the subscription was created.

## Step 5: Optimize for Cost Efficiency

1. Use AWS Free Tier for initial testing.
2. Monitor usage and scale resources as needed.
3. Enable logging and monitoring in AWS CloudWatch to track function performance and cost.

## Summary

In this chapter, you:
- Built a basic Node.js application with Stripe subscription functionality.
- Deployed the app using the Serverless Framework on AWS for cost efficiency.
- Verified the deployment and tested the functionality.

This project combines essential concepts of full-stack AI application development, showcasing how to build scalable, cost-effective solutions. You’re now equipped with the knowledge to design, deploy, and optimize applications in real-world environments.

