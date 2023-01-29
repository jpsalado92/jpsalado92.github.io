---
title: "Integrating a custom API in Google Sheets with Apps Script"
categories: data-analytics
tags: api apps-script google-workspace
---

This post is intended to be a reference to any programmer that needs a template project in order to integrate custom API
calls in Google Spreadsheets.
{: .notice--info}

## Intro

At my current job, we have a customized tool built upon Flask which has many purposes, some of them are:

* Extract data from multiple sources, leveraging custom connectors, on a scheduled basis.
* Perform ad hoc operations on this data.
* Store structured data as in a data warehouse.
* Serve data visualizations or any other resources that needs our curated data through our service's API.
* Provide a data catalog for our IAM-verified users through a friendly UI with tag support for multiple projects.

The thing is that as a small team, resources and mostly time are not on our side, but still we have to be able to
continuously deliver answers to the questions our fellow workers raise.

This is why we decided to set up an easy-to-maintain service to provide answers to them. This solution is fully
integrated in the Google Sheets toolbar, and enables them to use preconfigured API calls with inputs of their choice to
answer questions such as:

* Which data from the data warehouse is our project using?
* Which are the main data sources (raw origins) of our project?
* How is every bit of information in our project related to these sources?

**Notice:** This is the reasoning behind the solution that I offer in this tutorial, but the cool thing is that you can
apply this approach to any other API to list information as tables!
{: .notice--info}

## Setup

**1. Create a container-bound Apps Script project.** In order to do so, open the Google Sheet spreadsheet which would
like to bound to the Apps Script project and go to `Extensions > Apps Script`. This will lead you to the following
control panel.

![gapps-script-new-project]({{ site.url }}{{ site.baseurl }}/assets/images/gapps-script-new-project.png)

**2. Get the files in your project.** Copy the contents of the
following [repository](https://github.com/jpsalado92/apps-script-gsheet-api-integration) one by one in your project
structure, so you end up with something like this:

![gapps-script-gsheet-api-integration-project-structure]({{ site.url }}{{ site.baseurl }}/assets/images/gapps-script-gsheet-api-integration-project-structure.png)

**3. Save changes in your Apps Script project.**

Now if you return to the spreadsheet, and wait a little, a new tab in the toolbar should appear. In this example it's
called "Hontza Toolbox". This will lead you to different forms that will print different queries on your current sheet.

![gapps-script-gsheet-api-integration-ui]({{ site.url }}{{ site.baseurl }}/assets/images/gapps-script-gsheet-api-integration-ui.png)

For example, I have a preconfigured API call that can list all the entities tagged with a specific id.

![gapps-script-gsheet-api-form-running]({{ site.url }}{{ site.baseurl }}/assets/images/gapps-script-gsheet-api-form-running.png)

Once I press the "Ejecutar" button the sheet will create a table in the first available row listing details about all
these entities. Awesome right?

## Project structure

`hontza_toolbox.gs`: Javascript file containing the calls to the external API and the functions that serve the requested
data as a table.

`procedures.gs`: Javascript file that contains the main procedures executed when submitting forms.

`javascript.html`: This file contains client-server logic related to the behaviour of the forms, specifying what happens
when the form is submitted.

`ui.gs`: Functions that render our custom menu in the toolbar and cover form related mechanisms.

`stylesheet.html`: A basic CSS stylesheet that makes things look as if they were made by Google.

`*_form.html`: These files compose the skeleton of the forms to be submitted.

## References

* [Apps Script home](https://script.google.com/home)
* [Client-to-server communication](https://developers.google.com/apps-script/guides/html/communication)
* [HtmlService class](https://developers.google.com/apps-script/reference/html/)
* [UIs](https://developers.google.com/apps-script/guides/html)
* [Custom menus and dialogs](https://developers.google.com/apps-script/guides/menus)
