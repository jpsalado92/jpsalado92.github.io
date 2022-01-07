---
title: "Setting up Minimal Mistakes"
date:   2021-10-18 17:00:00 +0100
categories: reference web-development
tags: jekyll minimal-mistakes
toc: false
classes: wide
---
This post provides basic reference for applying the minimal mistakes theme to a Jekyll site.

## Jekyll Themes

When you create a new Jekyll site (by running the `jekyll new <PATH>` command), Jekyll installs a site that uses a
gem-based theme called Minima. But you can modify it!

Jekyll has an extensive theme system that allows you to leverage community-maintained templates and styles to customize
your site’s presentation. Jekyll themes specify plugins and package up assets, layouts, includes, and stylesheets in a
way that can be overridden by your site’s content.

## Minimal Mistakes

The theme used in this website is called [**Minimal Mistakes**](https://github.com/mmistakes/minimal-mistakes) and was designed by Michael
Rose. It is a flexible two-column Jekyll theme, perfect for building personal sites, blogs, and portfolios. As the name
implies, styling is purposely minimalistic to be enhanced and customized by you.

Among other things, this theme provides:

* Google Analytics support.
* Commenting support (currently powered by Disqus, Facebook, Google+, Discourse, static-based via Staticman, utterances,
  and giscus).
* SEO optimization.
* A built-in SCSS processor.

Learn more about this theme at its [official site](https://mmistakes.github.io/minimal-mistakes).

### Setup

In order to install it, we can add the following statement to our Gemfile.

```
gem "minimal-mistakes-jekyll"
```

Then, go out and install the gem in this gemfile by running the following command.

```shell
bundle install
```

**Watch out!** Migrating to a new time may cause that some layouts used by previous themes are no longer supported, as
old layouts may not be present in the newer theme.
{: .notice--warning}

## Next steps

Quite easy right? Now you are ready to go with your new theme! Still, you should definitely check the official docs so
you can properly configure this theme. I recommend starting with
the [`_config.yml` reference](https://mmistakes.github.io/minimal-mistakes/docs/configuration/), which explains the
basics of this theme and lets you configure powerful stuff as Google Analytics support or a plugin that allows
comments in your website.

**Note:** If you intend to use it with GitHub Pages, make sure you follow
the [remote theme configuration](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/#remote-theme-method).
{: .notice--info}

## References

* [Jekyll themes documentation](https://jekyllrb.com/docs/themes/)
* [mmistakes documentation](https://mmistakes.github.io/minimal-mistakes/)
* [mmistakes GitHub repository](https://github.com/mmistakes/minimal-mistakes)
* [Sample posts](https://mmistakes.github.io/minimal-mistakes/year-archive/) (you can find the source code
  at [/docs](https://github.com/mmistakes/minimal-mistakes/blob/master/docs) in the GitHub repository)
