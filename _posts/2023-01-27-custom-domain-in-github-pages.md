---
title: Integrating a custom domain with Github Pages
date: 2023-01-27 00:00:00 +0100
toc_sticky: true
excerpt: Learn how to add a custom domain to your Github Pages website and establish your own brand online.
categories: reference
tags: webdevelopment githubpages customdomain
---

## Introduction

As a developer, one of the most important things you can do in order to promote yourself is to have your **own custom domain for your website**. Not only does it make your website look more professional, but it also allows you to establish your own brand online.

In this blog post, I will be discussing how to **integrate a custom domain with your Github Pages website**. We will go over the steps you need to take to purchase a custom domain, configure your DNS settings, and set up your Github Pages repository.

By the end of this post, you will have a solid understanding of how to set up a custom domain for your Github Pages website.

## 1. Purchasing a Custom Domain

The first step is to purchase a custom domain from a domain registrar. You can refer to many domain providers like _GoDaddy_ or _Namecheap_. In my case I chose _Google Domains_, and the examples in the rest of the post will be related to that case.

The process of purchasing the domain through [Google Domains](https://domains.google/) is quite straightforward, so I wont be covering that in detail. Still, I suggest not to spend more than 15$/year in your new domain, since with that you should be able to cover a domain that is associated with your personal brand (like in my case with `jpsalado.dev` ). 

## 2. Configuring DNS Settings

The next step is to configure your new domain's DNS settings to point to Github's servers.

For that, you have to login into your domain registrar's control panel and create **"A"** records that point to Github's IP addresses. These can be found in their [official documentation](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain) and currently are: 

```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

Note that you can also create **"AAAA"** records to ensure IPv6 support.  
{: .notice--primary}

If you want to use the root domain (e.g. `jpsalado.dev` ) instead of a subdomain (e.g. `www.jpsalado.dev` ), you will also need to create a **CNAME** record in your domain registrar's control panel that points to your Github Pages repository (e.g. username.github.io)

In Google Domains this is how the setup for **A**, **AAAA** and the **CNAME** records looks:

![DNS Setup at Google Domains]({{ site.url }}{{ site.baseurl }}/assets/images/custom-domain-in-github-pages/google-domains-github-dns-setup.png)

## 3. Setting up your Github Pages Repository

Now you need to update the DNS settings in your GitHub Pages repository.

In your Github account, navigate to the repository that is hosting your Github Pages website. Go to the repository's settings, scroll down to the **Pages** section and in the **Custom domain** field, enter your custom domain name (e.g. `jpsalado.dev` ).

Note that it may take up to 48 hours for your DNS changes to propagate and for your custom domain to start working with your Github Pages website.
{: .notice--warning}

## Conclusion

In conclusion, setting up a custom domain for your Github Pages website is a great way to establish your own brand online and make your website look more professional.

By following the steps outlined in this blog post, you should now have a solid understanding of how to purchase a custom domain, configure your DNS settings, and set up your Github Pages repository.

**References**

* [Configuring a custom domain for your GitHub Pages site](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
* [Google Domains website](https://domains.google/)

## FAQ

**Q: What is DNS and why is it important when setting up a custom domain for my Github Pages website?**

**DNS** stands for **Domain Name System**. It is a system that translates domain names (e.g. `www.example.com` ) into IP addresses (e.g. `185.199.108.153` ) that computers can understand.

When setting up a custom domain for your Github Pages website, you need to configure your domain's DNS settings to point to Github's servers so that visitors can access your website using your custom domain name.

**Q: What is an Apex Domain and how does it differ from a subdomain?**

An **Apex Domain**, also known as a **root domain**, is a domain that does not include a subdomain prefix, such as `www` " or `blog` . For example, `example.com` is an apex domain, while `www.example.com` is a subdomain.

**Q: What are the "A" and "AAAA" records?**

A and AAAA records are types of DNS records that are used to map a domain name to an IP address.

* A records are used for mapping domain names to IPv4 addresses.
* AAAA records are used for mapping domain names to IPv6 addresses.

Both of these records allow the devices on the internet to find the server hosting the website or service you are trying to access. It is important to have both A and AAAA records to ensure that your website or service is accessible to all devices regardless of their IP version they use.

**Q: What is a CNAME record and when should I use it?**

A **CNAME (Canonical Name) record** is a type of DNS record that maps a subdomain (e.g. `www` ) to another domain name (e.g. `yourusername.github.io` ).

If you want to use the root domain (e.g. `example.com` ) instead of a subdomain (e.g. `www.example.com` ) with your Github Pages website, you will need to create a CNAME record in your domain registrar's control panel that points to your Github Pages repository (e.g. `username.github.io` ).

**Q: What is the TTL entry in the DNS records setup?**

**TTL (Time to Live)** is a value in the DNS record that determines for how long a browser or resolver should keep the information stored in its cache before it needs to request the information again. It's measured in seconds, usually the values are between 300 to 86400 seconds (5 minutes to 24 hours) . The lower the value, the sooner the browser or resolver will need to ask for the information again, while higher values make the information stay in the cache for longer periods of time. This can improve performance but also can make it take longer for any changes to propagate.

**Note:** This post was created with the help of ChatGPT, but it is crucial to recognize that the technology only assisted in its generation. The final structure, ideas, and accuracy of the content are all determined and reviewed by the author.
{: .notice--info}
