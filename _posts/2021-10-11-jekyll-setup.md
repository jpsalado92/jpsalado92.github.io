---
title: "Setting up a Jekyll powered site"
date: 2021-10-11 16:30:00 +0100
last_modified_at: 2021-12-15 16:30:00 +0100
excerpt: Enjoy a simple, responsive, and awesome personal site for free with Jekyll.
categories: web-development
tags: jekyll
---

Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites. Think of it
like a file-based CMS, without all the complexity. Jekyll takes your content, renders Markdown and Liquid templates, and
spits out a complete, static website ready to be served by Apache, Nginx or another web server. Jekyll is the engine
behind GitHub Pages, which you can use to host sites right from your GitHub repositories.

Some reasons to start a blog with Jekyll include:

* It's an easy method to have a good-looking responsive blog.
* Full integration with GitHub Pages.
* Create content just by writing Markdown files.
* It is a static content generator, which brings security to your website, as there are no calls to any database.
* Beginner-proof, no need to know HTML or CSS as we can leverage already written themes. Still, lets skilled programmers
  customize the whole thing.
* It is quite popular, the project has `43.9k` stars and `9.7k` forks in GitHub by now.

## Installing Jekyll

Jekyll is deployed as ruby gems, so we need to download and install the Ruby programming language. The easiest method is
to follow the instructions at the [installation section](https://jekyllrb.com/docs/installation/) where you can find
guides for different operating systems. These videos from Mike Dane are also worth watching:

* [Windows installation](https://youtu.be/LfP7Y9Ja6Qc)
* [Mac installation](https://youtu.be/WhrU9m82Wm8)

### Create a new project and run it locally

Open the shell prompt and `cd` to the folder in which the site will be created.

```shell
cd <SITE-DIRECTORY>
```

Then, choose a name for the site and install it using the following command:

```shell
jekyll new <SITE-NAME>
```

This will create a new directory with the site's name.

Now, `cd` into that directory and build the site making it available locally.

```shell
bundle install
bundle exec jekyll serve
```

By default, the site will run locally at [127.0.0.1:4000](http://127.0.0.1:4000/). If you access it, the basic template
for a jekyll site will be shown, ready to be filled with your posts and ideas!

## Jekyll Concepts

### Structure

Inside the main level folder of the site we have:

* `_posts`: The folder where you store all the blog posts. Posts follow a naming convention
  (date followed by name and everything separated by '-').
* `_site`: It is automatically generated every time we build our website, and determines the final output of it.
  Contains all the files needed to render the final website. It refreshes every time we build the website.
* `_config.yml`: Key value pairs to customize your website in a simple manner. Every time you change this file make sure
  you build the website again in order to see your changes applied.
* `gemfile`: File used by ruby to store all the dependencies for the website (jekyll version, external themes).

### Front matter

The **front matter** gives meta information about each of the pages and posts in our site to the Jekyll generator, so
that it can later render the page content in an expected manner. It may be written both in **YAML** and **JSON**.

It's represented as content delimited by three hyphens in the file header. We can use it to:

* Define basic variables of the page, which could be later rendered leveraging a template.
* Embrace taxonomy, organizing the file in a `collection`, `tag`, `category` logic.
* Define the layout of the file, which consists of templates to render the post.

The following example shows the front matter of a post, which includes the `title`, `date`, and `category` assigned to
that post.

```markdown
--- 
layout: post title: "Welcome to Jekyll!"
date: 2021-10-11 16:30:52 +0200 categories: jekyll update
--- 

## My header
Lorem Ipsumy stuff 
```

We can apply defaults to pages and posts in our website by adding a code snippet at `config.yaml`. In order to specify
which files will be affected we include a `scope` under the `defaults` key by:

* Defining the location of the files in a given `path`.
* Defining the `type` of these files.

The default values should be set under the `values` key as in the following example, which applies some defaults to
posts.

```yaml
defaults:
  # _posts
  - scope:
      path: ""
      type: posts
    values:
      layout: single
      author_profile: true
      read_time: true
      comments: true
      share: false
      related: false
```

## Writing content

### Posts

In order to write posts:

* Follow the `YYYY-MM-DD-title-title.md` naming structure. Just as in `2021-12-02-hello-world.md`.
* Create the `.md` file in any directory inside the `_posts` folder.
* Stuff as the title and the date may be inherited from the filename and from the front matter defaults, you can always
  override them declaring them explicitly in the files front matter.
* Add the content of the post by [writing in markdown](https://www.markdownguide.org/basic-syntax/).

### Drafts

Drafts might be included in a `_drafts` folder in the main directory. This lets us having drafts written as normal posts
avoiding them to show up in the website.

When serving locally, you can add the `–-drafts` option to the `jekyll serve` command in order to visualize them.

> Whenever you are ready to publish a draft, make sure you move it under the `posts` folder!

## Advanced customization

### Pages

Normally we deal with posts, which will be created automatically based on what is in the `_posts` folder, but we can
still define pages on our own. We may think of pages as something that is not a post, but need to be present in our
website, such as an "About" or "Contact" page.

To publish a custom page, we can simply create a `pagename.md` file in our root directory, or place it in a custom
folder. This file should contain front matter, as any other content file in our website, and might leverage a layout
present in the `_layouts` directory.

If the `permalink` property was not sent in the front matter, the URL for the page will be set to `\dir_name\file_name\`
(in case the file was included in a custom directory).

### Themes

By default jekyll comes bundled with the minima theme. If you want to use another theme look for it at
the [rubygems search](https://rubygems.org/search?query=jekyll-theme). Over there, you may find a wide range of themes
which usually include a link to their GitHub repository in which you can learn about installing them.

### Layouts

Layouts may be installed in the `_layouts` folder (other layouts already available are actually under the ruby gem).
They are normally written in `html` and include special **variables** , such as `content`, which renders the markdown
content of the file which uses this layout.

Layouts may also be defined in a multilevel hierarchy, so that one layout can inherit all the content specified in a
previous layout.

### Variables

There are plenty of variables in Jekyll, such as the `content` variable.

Variables in Jekyll are defined **between double brackets**.

They may be accessed on different levels:

* You can access layout variables as in `{% raw %}{{ layout.title }}{% endraw %}`.
* You can access post or page variables as in `{% raw %}{{ page.title }}{% endraw %}`.
* You can access site variables under `_config.yml` as in `{% raw %}{{ site.title }}{% endraw %}`.

More info on available variables may be found at
the [official jekyll variables site](https://jekyllrb.com/docs/variables/).

### Includes

Includes are special components of your website that may be distributed across different `.html` files. For example, you
might think of a footer or a header as common examples of includes.

These files should be located under the `_includes` folder in the root directory.

Once includes are defined, we are able to use them in our own layouts. If we were to include a `header.html` and
a `footer.html` in one of our layouts, we would write:

```html
<body>
{% raw %}{% include header.html %}
{{ content }}
{% include footer.html %}{% endraw %}
</body>
```

We can also define some information in these includes, for example, we can have the `header.html` accepting a color
parameter like this:

```html
<h1 style="color: {% raw %}{{ include.color }}{% endraw %}">{% raw %}{{ site.title }}</h1>{% endraw %}
<hr><br>
```

So we can specify a color parameter in the layout which uses it.

```html
<body>
{% raw %}{% include header.html color="blue" %}{% endraw %}
</body>
```

### Logic and flow control

When preparing templates, we can use **conditionals** to adapt the content of our layout. If statements are expressed
between brackets and percentage signs as in the following example:

```html
{% raw %}{% if page.show_sidebar %}
<div class="sidebar">
    sidebar content
</div>
{% endif %}{% endraw %}
```

Also, Jekyll we can use loops to go through the content of our website. In this example we list the posts of the whole
site:

```html
{% raw %}{% for post in site.posts %}
<li>
    <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
    {{ post.excerpt }}
</li>
{% endfor %}{% endraw %}
```

## Make it to GitHub Pages

GitHub Pages allows us to serve and host our Jekyll generated site completely free. In order to do so, follow these
instructions:

1. [Create a GitHub account](https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home)
   .
2. Create a GitHub repository with the following name structure: `username.github.io`.
3. [Install git](https://git-scm.com/downloads) on your computer.
4. Init your project folder as a repository. In order to do this, open your terminal, `cd` to your project directory and
   run `git init`.
5. Add all your files to the staging area (`git add .`) and commit them (`git commit -m "Initial commit"`).
6. Link your GitHub's repository as a remote origin for your local repository.

```shell
git remote add origin https://github.com/username/username.github.io.git
git branch -M main
```

7. Pull your files to the remote repository by running `git push -u origin main`.

> Note that it might take some minutes, but your site should be ready at `https:\\username.github.io`

Now you are ready to enjoy and start writing content for your free, simple and responsive awesome blog.

If you get stuck, you can follow these references:

* [Setting up GitHub pages](https://pages.github.com/)
* [Hosting on Github Pages](https://www.youtube.com/watch?v=fqFjuX4VZmU)

## References

* [Jekyll official repository](https://github.com/jekyll/jekyll)
* [Jekyll official site](https://jekyllrb.com/)
* [Jekyll video walkthroughts](https://jekyllrb.com/tutorials/video-walkthroughs/)
* [Jekyll variables](https://jekyllrb.com/docs/variables/)
