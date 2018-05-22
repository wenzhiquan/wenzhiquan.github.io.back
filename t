[1mdiff --git a/source/_posts/2016-06-20-linux-basic.md b/source/_posts/2016-06-20-linux-basic.md[m
[1mindex 5b6f51f..c1d3870 100644[m
[1m--- a/source/_posts/2016-06-20-linux-basic.md[m
[1m+++ b/source/_posts/2016-06-20-linux-basic.md[m
[36m@@ -9,7 +9,7 @@[m [mtags:[m
     - Linux[m
 ---[m
 [m
[31m-> “Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。”[m
[32m+[m[32m> "Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。"[m
 [m
 ### Linux系统简介[m
 [m
[36m@@ -23,9 +23,9 @@[m [mLinux是一个开源的免费操作系统，如下图所示，Linux就是`内核[m
 [m
 #### Linux之前Unix的历史[m
 [m
[31m-早在Linux出现之前20年，就已经有一个相当稳定而成熟的操作系统`Unix`，那么`Unix`又是如何诞生的呢？[m
[32m+[m[32m早在Linux出现之前20年，就已经有一个相当稳定而成熟的操作系统`Unix`，那么`Unix`又是如何诞生的呢?[m
 [m
[31m-* 1969年以前，Bell实验室、MIT、GE（通用电气公司）的`Multics`系统[m
[32m+[m[32m* 1969年以前，Bell实验室、MIT、GE(通用电气公司的)`Multics`系统[m
 [m
 > 当时的输入设备只有卡片阅读机，输出设备只有打印机，因此如果要测试某个程序，则需要将读卡纸插入卡片机，如果有错误，还需要重新来过。[m
 [m
[36m@@ -37,7 +37,7 @@[m [mLinux是一个开源的免费操作系统，如下图所示，Linux就是`内核[m
 [m
 > 仅仅用4个星期，他就以汇编语言写了一组内核程序， 同时包括一些内核工具程序，以及一个小的文件系统，这个系统就是Unix系统的原型。Thompson将Multics系统简化了不少，同实验室的朋友戏称这个系统为Unics。[m
 [m
[31m-> 这个文件系统有两个重要的概念：① 所有的程序或系统装置都是文件；② 不管构件编辑器还是附属文件，所写的程序只有一个目的，就是有效的完成目标。[m
[32m+[m[32m> 这个文件系统有两个重要的概念：1) 所有的程序或系统装置都是文件；2) 不管构件编辑器还是附属文件，所写的程序只有一个目的，就是有效的完成目标。[m
 [m
 * 1973年，Unix正式诞生，Ritchie等人以C语言写出第一个正式Unix内核[m
 [m
[36m@@ -57,7 +57,7 @@[m [mLinux是一个开源的免费操作系统，如下图所示，Linux就是`内核[m
 [m
 * 1984年之二，GNU项目与FSF基金会成立[m
 [m
[31m-> Richard Mathew Stallman在1984年发起GNU项目，目的是创建一个自由、开放的Unix操作系统（Free Unix）。他从开发Unix可运行的小程序开始，开发了GCC、Emacs、Bash Shell、GLIBC等软件，打开了GNU项目的知名度，并成立了自由软件基金会[m
[32m+[m[32m> Richard Mathew Stallman在1984年发起GNU项目，目的是创建一个自由、开放的Unix操作系统（Free Unix）。他从开发Unix可运行的小程序开始，开发了GCC、Emacs、Bash Shell、GLIBC等软件，打开了GNU项目的知名度，并成立了自由软件基金会[m
 [m
 * 1985 年，GNU的通用公共许可证[m
 [m
[1mdiff --git a/source/_posts/2018-05-04-move-to-hexo-blog.md b/source/_posts/2018-05-04-move-to-hexo-blog.md[m
[1mindex 8bb7b1b..02715df 100644[m
[1m--- a/source/_posts/2018-05-04-move-to-hexo-blog.md[m
[1m+++ b/source/_posts/2018-05-04-move-to-hexo-blog.md[m
[36m@@ -391,7 +391,7 @@[m [mrecent_posts: true[m
 安装插件：[m
 [m
 ```[m
[31m-npm install hexo-wordcount --save[m
[32m+[m[32mnpm install hexo-symbols-count-time --save[m
 ```[m
 [m
 然后在`theme/next/layout/_partials/footer.swig`文件尾部添加[m
[36m@@ -399,7 +399,7 @@[m [mnpm install hexo-wordcount --save[m
 ```[m
 <div class="theme-info">[m
   <div class="powered-by"></div>[m
[31m-  <span class="post-count">博客全站共{{ totalcount(site) }}字</span>[m
[32m+[m[32m  <span class="post-count">博客全站共{{ item_text_total(site) }}字</span>[m
 </div>[m
 ```[m
 [m
[1mdiff --git a/themes/next/.github/CONTRIBUTING.md b/themes/next/.github/CONTRIBUTING.md[m
[1mindex 9175b91..4d80ec2 100644[m
[1m--- a/themes/next/.github/CONTRIBUTING.md[m
[1m+++ b/themes/next/.github/CONTRIBUTING.md[m
[36m@@ -1,6 +1,142 @@[m
[31m-Before submitting an issue, please search for the issue [here](https://github.com/iissnan/hexo-theme-next/issues?utf8=%E2%9C%93&q=) to find if the issue is already reported.[m
[32m+[m[32m<div align="right">Language: :us:[m
[32m+[m[32m<a title="Chinese" href="../docs/zh-CN/CONTRIBUTING.md">:cn:</a>[m
[32m+[m[32m<a title="Russian" href="../docs/ru/CONTRIBUTING.md">:ru:</a></div>[m
 [m
[31m-Also, you can search for answers on the [NexT Documentation Site](http://theme-next.iissnan.com/):[m
[32m+[m[32m# <div align="center"><a title="Go to homepage" href="https://theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>[m
 [m
[31m-- [常见问题 - 中文文档](http://theme-next.iissnan.com/faqs.html)[m
[31m-- FAQs (Work in progress)[m
[32m+[m[32mFirst of all, thanks for taking your time to contribute and help make our project even better than it is today! The following is a set of guidelines for contributing to [Theme-Next](https://github.com/theme-next) and its libs submodules. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.[m
[32m+[m
[32m+[m[32m## Table Of Contents[m
[32m+[m
[32m+[m[32m[How Can I Contribute?](#how-can-i-contribute)[m
[32m+[m
[32m+[m[32m  * [Before Submitting An Issue](#before-submitting-an-issue)[m
[32m+[m[32m  * [Reporting Bugs](#reporting-bugs)[m
[32m+[m[32m  * [Suggesting Enhancements](#suggesting-enhancements)[m
[32m+[m[32m  * [Submitting a Pull Request](#submitting-a-pull-request)[m
[32m+[m[32m  * [Creating Releases](#creating-releases)[m
[32m+[m
[32m+[m[32m[Guides](#guides)[m
[32m+[m
[32m+[m[32m  * [Coding Rules](#coding-rules)[m
[32m+[m[32m  * [Coding Standards](#coding-standards)[m
[32m+[m[32m  * [Commit Messages Rules](#commit-messages-rules)[m
[32m+[m
[32m+[m[32m<a name="how-can-i-contribute"></a>[m
[32m+[m[32m## How Can I Contribute?[m
[32m+[m
[32m+[m[32mMain Theme-Next repository was rebased from [iissnan's](https://github.com/iissnan/hexo-theme-next) profile to [Theme-Next](https://github.com/theme-next) organization on GitHub. Most libraries under the `next/source/lib` directory was moved out to [external repos](https://github.com/theme-next) under NexT organization. Version 5 works fine at most cases, but for frequent users, you maybe need to [upgrade version 5 to 6](https://github.com/theme-next/hexo-theme-next/blob/master/docs/UPDATE-FROM-5.1.X.md) to get features and supports in new [Theme-Next](https://github.com/theme-next/hexo-theme-next) repository.[m
[32m+[m
[32m+[m[32m<a name="before-submitting-an-issue"></a>[m
[32m+[m[32m### Before Submitting An Issue[m
[32m+[m
[32m+[m[32mIf you just have a question, you'll get faster results by checking the FAQs for a list of common questions and problems (Work in progress) or the [«NexT» Documentation Site](https://theme-next.org/docs/) (Work in progress).[m
[32m+[m
[32m+[m[32mAlso, you can perform a [cursory search](https://github.com/theme-next/hexo-theme-next/search?q=&type=Issues&utf8=%E2%9C%93) to see if the problem has already been reported or solved. You don't want to duplicate effort. You might be able to find the cause of the problem and fix things yourself, or add comments to the existed issue.[m
[32m+[m
[32m+[m[32mIf you find a bug in the source code, most importantly, please check carefully if you can reproduce the problem [in the latest release version of Next](https://github.com/theme-next/hexo-theme-next/releases/latest). Then, you can help us by[m
[32m+[m[32m[Reporting Bugs](#reporting-bugs) or [Suggesting Enhancements](#suggesting-enhancements) to our [ Repository](https://github.com/theme-next/hexo-theme-next). Even better, you can[m
[32m+[m[32m[submit a Pull Request](#submitting-a-pull-request) with a fix.[m
[32m+[m
[32m+[m[32m<a name="reporting-bugs"></a>[m
[32m+[m[32m### Reporting Bugs[m
[32m+[m
[32m+[m[32mBefore creating bug reports, please check [this list](#before-submitting-an-issue) as you might find out that you don't need to create one. After you've determined the repository your bug is related to, create an issue on that repository and provide the information as many details as possible by filling in [the required template](ISSUE_TEMPLATE.md).[m
[32m+[m
[32m+[m[32mFollowing these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior, and find related reports:[m
[32m+[m
[32m+[m[32m* Use a clear and descriptive title for the issue to identify the problem.[m
[32m+[m[32m* Provide more context by answering these questions:[m
[32m+[m[32m    * Can you reproduce the problem? Can you reliably reproduce the issue? If not, provide details about how often the problem happens and under which conditions it normally happens.[m
[32m+[m[32m    * Did the problem start happening recently or was this always a problem?[m
[32m+[m[32m    * If the problem started happening recently, can you reproduce the problem in an older version of Next? What's the most recent version in which the problem doesn't happen? You can download older versions of Next from [the releases page](https://github.com/theme-next/hexo-theme-next/releases).[m
[32m+[m[32m    * Which version of Node, Hexo and Next are you using? You can get the exact version by running `node -v`, `hexo version` in your terminal, or copy the contents in site's`package.json`.[m
[32m+[m[32m    * Which packages do you have installed? You can get that list by copying the contents in site's`package.json`.[m
[32m+[m[32m* Describe the exact steps which reproduce the problem in as many details as possible. When listing steps, don't just say what you did, but explain how you did it, e.g. which command exactly you used. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/creating-and-highlighting-code-blocks/) or [a permanent link to a code snippet](https://help.github.com/articles/creating-a-permanent-link-to-a-code-snippet/), or a [Gist link](https://gist.github.com/).[m
[32m+[m[32m* Provide specific examples to demonstrate the steps. Include links to files (screenshots or GIFs) or live demo.[m
[32m+[m[32m* Describe the behavior you observed after following the steps and point out what exactly is the problem with that behavior.[m
[32m+[m[32m* Explain which behavior you expected to see instead and why.[m
[32m+[m
[32m+[m[32m### Suggesting Enhancements[m
[32m+[m
[32m+[m[32mBefore creating enhancement suggestions, please check [this list](#before-submitting-an-issue) as you might find out that you don't need to create one. After you've determined the repository your enhancement suggestion is related to, create an issue on that repository and provide the information as many details as possible by filling in [the required template](ISSUE_TEMPLATE.md).[m
[32m+[m
[32m+[m[32mFollowing these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions.[m
[32m+[m
[32m+[m[32m* Use a clear and descriptive title for the issue to identify the suggestion.[m
[32m+[m[32m* Describe the current behavior and explain which behavior you expected to see instead and Explain why this enhancement would be useful to most users.[m
[32m+[m[32m* Provide specific examples to demonstrate the suggestion. Include links to files (screenshots or GIFs) or live demo.[m
[32m+[m
[32m+[m[32m### Submitting a Pull Request[m
[32m+[m
[32m+[m[32mBefore creating a Pull Request (PR), please check [this list](#before-submitting-an-issue) as you might find out that you don't need to create one. After you've determined the repository your pull request is related to, create a pull request on that repository. The detailed document of creating a pull request can be found [here](https://help.github.com/articles/creating-a-pull-request/).[m
[32m+[m
[32m+[m[32m1. On GitHub, navigate to the original page of the [hexo-theme-next](https://github.com/theme-next/hexo-theme-next). In the top-right corner of the page, click **Fork**.[m
[32m+[m[32m2. Under the repository name in your forked repository, click **Clone or download**. In the `Clone with SSH` section, copy the clone URL for the repository. Open Git Bash, and change the current working directory to the location where you want the cloned directory to be made. Type `git clone`, and then paste the URL you copied. Press **Enter**. Your local clone will be created.[m
[32m+[m[32m    ```bash[m
[32m+[m[32m    $ git clone git@github.com:username/hexo-theme-next.git[m
[32m+[m[32m    ```[m
[32m+[m[32m3. Navigate into your new cloned repository. Switch branches to the compare branch of the pull request where the original changes were made.[m
[32m+[m[32m    ```bash[m
[32m+[m[32m    $ cd hexo-theme-next[m
[32m+[m[32m    $ git checkout -b patchname[m
[32m+[m[32m    ```[m
[32m+[m[32m4. After you commit your changes to the head branch of the pull request you can push your changes up to the original pull request directly.[m
[32m+[m[32m    ```bash[m
[32m+[m[32m    $ git add .[m
[32m+[m[32m    $ git commit -m "add commit messamge"[m
[32m+[m[32m    $ git push origin patchname[m
[32m+[m[32m    ```[m
[32m+[m[32m5. Navigate to the original repository you created your fork from. To the right of the Branch menu, click **New pull request**. On the Compare page, confirm that the base fork is the repository you'd like to merge changes into. Use the base branch drop-down menu to select the branch of the upstream repository you'd like to merge changes into. Use the head fork drop-down menu to select your fork, then use the compare branch drop-down menu to select the branch you made your changes in. Click **Create pull request** and type a title and description for your pull request.[m
[32m+[m
[32m+[m[32mFollowing these guidelines helps maintainers and the community understand your pull request :pencil::[m
[32m+[m
[32m+[m[32m* Follow our [Coding Rules](#coding-rules) and [commit message conventions](#commit-messages-rules).[m
[32m+[m[32m* Use a clear and descriptive title for the issue to identify the pull request. Do not include issue numbers in the PR title.[m
[32m+[m[32m* Fill in [the required template](PULL_REQUEST_TEMPLATE.md) as many details as possible.[m
[32m+[m[32m* All features or bug fixes must be tested in all schemes. And provide specific examples to demonstrate the pull request. Include links to files (screenshots or GIFs) or live demo.[m
[32m+[m
[32m+[m[32m### Creating Releases[m
[32m+[m
[32m+[m[32mReleases are a great way to ship projects on GitHub to your users.[m
[32m+[m
[32m+[m[32m1. On GitHub, navigate to the main page of the repository. Under your repository name, click **Releases**. Click **Draft a new release**.[m
[32m+[m[32m2. Type a version number for your release. Versions are based on [Git tags](https://git-scm.com/book/en/Git-Basics-Tagging). We recommend naming tags that fit within [About Major and Minor NexT versions](https://github.com/theme-next/hexo-theme-next/issues/187).[m
[32m+[m[32m3. Select a branch that contains the project you want to release. Usually, you'll want to release against your `master` branch, unless you're releasing beta software.[m
[32m+[m[32m4. Type a title and description that describes your release.[m
[32m+[m[32m    - Use the version as the title.[m
[32m+[m[32m    - The types of changes include **Breaking Changes**, **Updates**, **Features**, and **Bugfixes**. In the section of Breaking Changes, use multiple secondary headings, and use item list in other sections.[m
[32m+[m[32m    - Use the passive tense and subject-less sentences.[m
[32m+[m[32m    - All changes must be documented in release notes. If commits happen without pull request (minimal changes), just add this commit ID into release notes. If commits happen within pull request alreay, just add the related pull request ID including all possible commits.[m
[32m+[m[32m5. If you'd like to include binary files along with your release, such as compiled programs, drag and drop or select files manually in the binaries box.[m
[32m+[m[32m6. If the release is unstable, select **This is a pre-release** to notify users that it's not ready for production. If you're ready to publicize your release, click **Publish release**. Otherwise, click **Save draft** to work on it later.[m
[32m+[m
[32m+[m[32m## Guides[m
[32m+[m
[32m+[m[32m### Coding Rules[m
[32m+[m
[32m+[m[32mThis project and everyone participating in it is governed by the [Code of Conduct](CODE_OF_CONDUCT.md) to keep open and inclusive. By participating, you are expected to uphold this code.[m
[32m+[m
[32m+[m[32m### Coding Standards[m
[32m+[m
[32m+[m[32mTo be continued.[m
[32m+[m
[32m+[m[32m### Commit Messages Rules[m
[32m+[m
[32m+[m[32mWe have very precise rules over how our git commit messages can be formatted. Each commit message consists of a `type` and a `subject`. This leads to more[m
[32m+[m[32mreadable messages that are easy to follow when looking through the project history.[m
[32m+[m
[32m+[m[32m- `type` describes the meaning of this commit including but not limited to the following items, and capitalize the first letter.[m
[32m+[m[32m    * `Build`: Changes that affect the build system or external dependencies[m
[32m+[m[32m    * `Ci`: Changes to our CI configuration files and scripts[m
[32m+[m[32m    * `Docs`: Documentation only changes[m
[32m+[m[32m    * `Feat`: A new feature[m
[32m+[m[32m    * `Fix`: A bug fix[m
[32m+[m[32m    * `Perf`: A code change that improves performance[m
[32m+[m[32m    * `Refactor`: A code change that neither fixes a bug nor adds a feature[m
[32m+[m[32m    * `Style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)[m
[32m+[m[32m    * `Revert`: Revert some existing commits[m
[32m+[m[32m    * `Release`: Commit a release for a conventional changelog project[m
[32m+[m[32m- The `subject` contains a succinct description of the change, like `Update code highlighting in readme.md`.[m
[32m+[m[32m    * No dot (.) at the end.[m
[32m+[m[32m    * Use the imperative, present tense: "change" not "changed" nor "changes".[m
[1mdiff --git a/themes/next/.github/ISSUE_TEMPLATE.md b/themes/next/.github/ISSUE_TEMPLATE.md[m
[1mindex debe5b4..8332ad0 100644[m
[1m--- a/themes/next/.github/ISSUE_TEMPLATE.md[m
[1m+++ b/themes/next/.github/ISSUE_TEMPLATE.md[m
[36m@@ -3,15 +3,15 @@[m [mIF YOU DON'T FILL OUT THE FOLLOWING INFORMATION WE MIGHT CLOSE YOUR ISSUE WITHOU[m
 如果你不填充下面的内容，我们可能会直接关闭你的 issue。[m
 [m
 If you want to fast resolve your issue, WRITE IT IN ENGLISH, please. Not all contributors/collaborators know Chinese language and Google translate can't always give true translates on issues. Thanks![m
[31m-You may delete this recomendations and use template which is placed below. [m
[32m+[m[32mYou may delete this recomendations and use template which is placed below.[m
 -->[m
 [m
 ### I agree and want to create new issue <!-- (我确认我已经查看了) -->[m
 [m
[31m-<!-- Check all with "x" (使用 "x" 选择) -->[m
[31m-- [] Yes, I was on [Hexo Docs page](https://hexo.io/docs/), especially on [Templates](https://hexo.io/docs/templates.html), [Variables](https://hexo.io/docs/variables.html), [Helpers](https://hexo.io/docs/helpers.html) and [Troubleshooting](https://hexo.io/docs/troubleshooting.html).[m
[31m-- [] Yes, I was on [NexT Documentation Site](http://theme-next.iissnan.com/).[m
[31m-- [] And yes, I already searched for current [issues](https://github.com/iissnan/hexo-theme-next/issues?utf8=%E2%9C%93&q=is%3Aissue) and this is not help to me.[m
[32m+[m[32m<!-- Check all with [x] (把 [ ] 换成 [X] 来选择) -->[m
[32m+[m[32m- [ ] Yes, I was on [Hexo Docs page](https://hexo.io/docs/), especially on [Templates](https://hexo.io/docs/templates.html), [Variables](https://hexo.io/docs/variables.html), [Helpers](https://hexo.io/docs/helpers.html) and [Troubleshooting](https://hexo.io/docs/troubleshooting.html).[m
[32m+[m[32m- [ ] Yes, I was on [NexT Documentation Site](http://theme-next.org/docs/).[m
[32m+[m[32m- [ ] And yes, I already searched for current [issues](https://github.com/theme-next/hexo-theme-next/issues?utf8=%E2%9C%93&q=is%3Aissue) and this is not help to me.[m
 [m
 ***[m
 [m
[36m@@ -29,30 +29,56 @@[m [mYou may delete this recomendations and use template which is placed below.[m
 * Link to demo site with this issue: N/A[m
 * Link(s) to source code or any usefull link(s): N/A[m
 [m
[32m+[m[32m### Node.js and NPM Information[m
[32m+[m[32m<!-- Paste output from `node -v && npm -v`  (粘贴 `node -v && npm -v` 输出的信息) -->[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m### Package dependencies Information[m
[32m+[m[32m<!-- Paste output from `cat package.json`  (粘贴 `cat package.json` 输出的信息) -->[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m```[m
[32m+[m
 ### Hexo Information[m
[31m-<!-- Paste info from `hexo -v`  (粘貼信息 `hexo -v`) -->[m
[32m+[m
[32m+[m[32m#### Hexo version[m
[32m+[m[32m<!-- Paste output from `hexo -v`  (粘贴 `hexo -v` 输出的信息) -->[m
 ```[m
 [m
 ```[m
 [m
[32m+[m[32m#### Hexo Configuration[m
[32m+[m[32m<!-- Paste configuration from Hexo `_config.yml`  (从 Hexo `_config.yml` 中粘贴信息) -->[m
[32m+[m[32m```yml[m
[32m+[m
[32m+[m[32m```[m
[32m+[m
 ### NexT Information[m
 [m
 **NexT Version:**[m
[31m-<!-- Check one with "x" (使用 "x" 选择) -->[m
[31m-```[m
[31m-[] Latest Master branch.[m
[31m-[] Latest Release version.[m
[31m-[] Old version - [m
[31m-```[m
[32m+[m[32m<!-- Check needed with [x] (把 [ ] 换成 [X] 来选择) -->[m
[32m+[m
[32m+[m[32m- [ ] Latest Master branch[m
[32m+[m[32m- [ ] Latest Release version[m
[32m+[m[32m- [ ] Old version[m
[32m+[m
 [m
 **NexT Scheme:**[m
[31m-<!-- Check one with "x" (使用 "x" 选择) -->[m
[31m-```[m
[31m-[] All schemes[m
[31m-[] Muse[m
[31m-[] Mist[m
[31m-[] Pisces[m
[31m-[] Gemini[m
[32m+[m[32m<!-- Check needed with [x] (把 [ ] 换成 [X] 来选择) -->[m
[32m+[m
[32m+[m[32m- [ ] All schemes[m
[32m+[m[32m- [ ] Muse[m
[32m+[m[32m- [ ] Mist[m
[32m+[m[32m- [ ] Pisces[m
[32m+[m[32m- [ ] Gemini[m
[32m+[m
[32m+[m
[32m+[m[32m#### NexT Configuration:[m
[32m+[m[32m<!-- Paste ONLY CHANGED CONFIGURATION from NexT `_config.yml` (只粘贴NexT主题配置文件 `_config.yml` 中修改过的部分) -->[m
[32m+[m[32m```yml[m
[32m+[m
 ```[m
 [m
 ### Other Information <!-- (Like Browser, System, Screenshots) -->[m
[1mdiff --git a/themes/next/.github/PULL_REQUEST_TEMPLATE.md b/themes/next/.github/PULL_REQUEST_TEMPLATE.md[m
[1mindex af32032..0dc55ec 100644[m
[1m--- a/themes/next/.github/PULL_REQUEST_TEMPLATE.md[m
[1m+++ b/themes/next/.github/PULL_REQUEST_TEMPLATE.md[m
[36m@@ -13,7 +13,7 @@[m
 ## PR Checklist[m
 **Please check if your PR fulfills the following requirements:**[m
 [m
[31m-- [ ] The commit message follows [our guidelines](https://github.com/iissnan/hexo-theme-next/blob/master/.github/CONTRIBUTING.md).[m
[32m+[m[32m- [ ] The commit message follows [our guidelines](https://github.com/theme-next/hexo-theme-next/blob/master/.github/CONTRIBUTING.md).[m
 - [ ] Tests for the changes have been added (for bug fixes / features).[m
    - [ ] Muse | Mist have been tested.[m
    - [ ] Pisces | Gemini have been tested.[m
[36m@@ -55,7 +55,7 @@[m [mIn NexT `_config.yml`:[m
 <!-- If this PR contains a breaking change, please describe the impact and migration path for existing applications below. -->[m
 [m
 <!-- BIG pull template -->[m
[31m-<!-- [m
[32m+[m[32m<!--[m
 1. xxxxxxx - commit link on modified file. Just copy this below your pull request readme.[m
 2. You can paste any image directly from your clipboard. Just press **Print Scr** and paste it into pull readme - link on image will generate and paste automaticly.[m
 -->[m
[1mdiff --git a/themes/next/.gitignore b/themes/next/.gitignore[m
[1mindex df03369..26b5eab 100644[m
[1m--- a/themes/next/.gitignore[m
[1m+++ b/themes/next/.gitignore[m
[36m@@ -6,15 +6,17 @@[m [myarn.lock[m
 package-lock.json[m
 node_modules/[m
 [m
[31m-# Ignore unused verdors' files[m
[31m-source/lib/fancybox/*[m
[31m-!source/lib/fancybox/source/[m
[32m+[m[32m# Ignore optional external libraries[m
[32m+[m[32msource/lib/*[m
 [m
[32m+[m[32m# Track internal libraries & Ignore unused verdors files[m
 source/lib/font-awesome/less/[m
 source/lib/font-awesome/scss/[m
[32m+[m[32m!source/lib/font-awesome/*[m
[32m+[m
[32m+[m[32m!source/lib/jquery/[m
 [m
 source/lib/ua-parser-js/*[m
 !source/lib/ua-parser-js/dist/[m
 [m
[31m-source/lib/Han/*[m
[31m-!source/lib/Han/dist/[m
[32m+[m[32m!source/lib/velocity/[m
[1mdiff --git a/themes/next/.travis.yml b/themes/next/.travis.yml[m
[1mindex a607f87..9591f0b 100644[m
[1m--- a/themes/next/.travis.yml[m
[1m+++ b/themes/next/.travis.yml[m
[36m@@ -1,5 +1,6 @@[m
 language: node_js[m
[31m-node_js: node[m
[32m+[m[32m#node_js: node[m
[32m+[m[32mnode_js: lts/*[m
 [m
 cache:[m
   directories:[m
[1mdiff --git a/themes/next/_config.yml b/themes/next/_config.yml[m
[1mold mode 100755[m
[1mnew mode 100644[m
[1mindex d64ea8d..b811ec4[m
[1m--- a/themes/next/_config.yml[m
[1m+++ b/themes/next/_config.yml[m
[36m@@ -1,19 +1,37 @@[m
[31m-# ===============================================================[m
[31m-# ========================= ATTENTION! ==========================[m
[31m-# ===============================================================[m
[31m-# NexT repository is moving here: https://github.com/theme-next[m
[31m-# ===============================================================[m
[31m-# It's rebase to v6.0.0 and future maintenance will resume there[m
[31m-# ===============================================================[m
[31m-[m
 # ---------------------------------------------------------------[m
 # Theme Core Configuration Settings[m
 # ---------------------------------------------------------------[m
 [m
[31m-# Set to true, if you want to fully override the default configuration.[m
[31m-# Useful if you don't want to inherit the theme _config.yml configurations.[m
[32m+[m[32m# If false, merge configs from `_data/next.yml` into default configuration (rewrite).[m
[32m+[m[32m# If true, will fully override default configuration by options from `_data/next.yml` (override). Only for NexT settings.[m
[32m+[m[32m# And if true, all config from default NexT `_config.yml` must be copied into `next.yml`. Use if you know what you are doing.[m
[32m+[m[32m# Useful if you want to comment some options from NexT `_config.yml` by `next.yml` without editing default config.[m
 override: false[m
 [m
[32m+[m[32m# Allow to cache content generation. Introduced in NexT v6.0.0.[m
[32m+[m[32mcache:[m
[32m+[m[32m  enable: true[m
[32m+[m
[32m+[m[32m# Redefine custom file paths. Introduced in NexT v6.0.2.[m
[32m+[m[32m# If commented, will be used default custom file paths.[m
[32m+[m
[32m+[m[32m# For example, you want to put your custom styles file[m
[32m+[m[32m# outside theme directory in root `source/_data`, set[m
[32m+[m[32m# `styles: source/_data/styles.styl`[m
[32m+[m[32m#custom_file_path:[m
[32m+[m[32m  # Default paths: layout/_custom/*[m
[32m+[m[32m  #head: source/_data/head.swig[m
[32m+[m[32m  #header: source/_data/header.swig[m
[32m+[m[32m  #sidebar: source/_data/sidebar.swig[m
[32m+[m
[32m+[m[32m  # Default path: source/css/_variables/custom.styl[m
[32m+[m[32m  #variables: source/_data/variables.styl[m
[32m+[m[32m  # Default path: source/css/_mixins/custom.styl[m
[32m+[m[32m  #mixins: source/_data/mixins.styl[m
[32m+[m[32m  # Default path: source/css/_custom/custom.styl[m
[32m+[m[32m  #styles: source/_data/styles.styl[m
[32m+[m
[32m+[m
 # ---------------------------------------------------------------[m
 # Site Information Settings[m
 # ---------------------------------------------------------------[m
[36m@@ -35,10 +53,10 @@[m [mfavicon:[m
   #ms_browserconfig: /images/browserconfig.xml[m
 [m
 # Set default keywords (Use a comma to separate)[m
[31m-keywords: "Hexo, NexT"[m
[32m+[m[32mkeywords: "Hexo, NexT, Wenzhiquan"[m
 [m
 # Set rss to false to disable feed link.[m
[31m-# Leave rss as empty to use site's feed link.[m
[32m+[m[32m# Leave rss as empty to use site's feed link, and install hexo-generator-feed: `npm install hexo-generator-feed --save`.[m
 # Set rss to specific value if you have burned your feed already.[m
 rss:[m
 [m
[36m@@ -48,13 +66,23 @@[m [mfooter:[m
   #since: 2015[m
 [m
   # Icon between year and copyright info.[m
[31m-  icon: user[m
[32m+[m[32m  icon:[m
[32m+[m[32m    # Icon name in fontawesome, see: https://fontawesome.com/v4.7.0/icons[m
[32m+[m[32m    # `heart` is recommended with animation in red (#ff0000).[m
[32m+[m[32m    name: user[m
[32m+[m[32m    # If you want to animate the icon, set it to true.[m
[32m+[m[32m    animated: false[m
[32m+[m[32m    # Change the color of icon, using Hex Code.[m
[32m+[m[32m    color: "#808080"[m
 [m
   # If not defined, will be used `author` from Hexo main config.[m
   copyright:[m
   # -------------------------------------------------------------[m
[31m-  # Hexo link (Powered by Hexo).[m
[31m-  powered: true[m
[32m+[m[32m  powered:[m
[32m+[m[32m    # Hexo link (Powered by Hexo).[m
[32m+[m[32m    enable: true[m
[32m+[m[32m    # Version info of Hexo after Hexo link (vX.X.X).[m
[32m+[m[32m    version: true[m
 [m
   theme:[m
     # Theme & scheme info link (Theme - NexT.scheme).[m
[36m@@ -63,7 +91,7 @@[m [mfooter:[m
     version: true[m
   # -------------------------------------------------------------[m
   # Any custom text can be defined here.[m
[31m-  #custom_text: Hosted by <a target="_blank" href="https://pages.github.com">GitHub Pages</a>[m
[32m+[m[32m  #custom_text: Hosted by <a target="_blank" rel="external nofollow" href="https://pages.coding.me"><b>Coding Pages</b></a>[m
 [m
 # ---------------------------------------------------------------[m
 # SEO Settings[m
[36m@@ -101,29 +129,34 @@[m [mmenu:[m
   #sitemap: /sitemap.xml || sitemap[m
   #commonweal: /404/ || heartbeat[m
 [m
[31m-# Enable/Disable menu icons.[m
[31m-menu_icons:[m
[31m-  enable: true[m
[32m+[m[32m# Enable/Disable menu icons / item badges.[m
[32m+[m[32mmenu_settings:[m
[32m+[m[32m  icons: true[m
[32m+[m[32m  badges: true[m
 [m
 # 最近文章配置[m
 recent_posts_title: 近期文章[m
 recent_posts_layout: block[m
 recent_posts: true[m
[32m+[m
 # ---------------------------------------------------------------[m
 # Scheme Settings[m
 # ---------------------------------------------------------------[m
 [m
 # Schemes[m
[31m-# scheme: Muse[m
[31m-# scheme: Mist[m
[32m+[m[32m#scheme: Muse[m
[32m+[m[32m#scheme: Mist[m
 scheme: Pisces[m
[31m-# scheme: Gemini[m
[32m+[m[32m#scheme: Gemini[m
 [m
 [m
 # ---------------------------------------------------------------[m
 # Sidebar Settings[m
 # ---------------------------------------------------------------[m
 [m
[32m+[m[32m# Posts / Categories / Tags in sidebar.[m
[32m+[m[32msite_state: true[m
[32m+[m
 # Social Links.[m
 # Usage: `Key: permalink || icon`[m
 # Key is the link label showing to end users.[m
[36m@@ -132,10 +165,13 @@[m [mscheme: Pisces[m
 social:[m
   GitHub: https://github.com/yourname || github-alt[m
   知乎: https://www.zhihu.com/people/wenzhiquan/activities[m
[31m-  E-Mail: mailto:wenzhiquanr@163.com || envelope[m
[32m+[m[32m  邮箱: mailto:wenzhiquanr@163.com || envelope[m
[32m+[m[32m  Facebook: https://www.facebook.com/profile.php?id=100006943363300 || facebook[m
[32m+[m[32m  #GitHub: https://github.com/yourname || github[m
[32m+[m[32m  #E-Mail: mailto:yourname@gmail.com || envelope[m
   #Google: https://plus.google.com/yourname || google[m
   #Twitter: https://twitter.com/yourname || twitter[m
[31m-  Facebook: https://www.facebook.com/profile.php?id=100006943363300 || facebook[m
[32m+[m[32m  #FB Page: https://www.facebook.com/yourname || facebook[m
   #VK Group: https://vk.com/yourname || vk[m
   #StackOverflow: https://stackoverflow.com/yourname || stack-overflow[m
   #YouTube: https://youtube.com/yourname || youtube[m
[36m@@ -146,6 +182,16 @@[m [msocial_icons:[m
   enable: true[m
   icons_only: false[m
   transition: false[m
[32m+[m[32m  # Dependencies: exturl: true in Tags Settings section below.[m
[32m+[m[32m  # To encrypt links above use https://www.base64encode.org[m
[32m+[m[32m  # Example encoded link: `GitHub: aHR0cHM6Ly9naXRodWIuY29tL3RoZW1lLW5leHQ= || github`[m
[32m+[m[32m  exturl: false[m
[32m+[m
[32m+[m[32m# Follow me on GitHub banner in right-top corner.[m
[32m+[m[32m# Usage: `permalink || title`[m
[32m+[m[32m# Value before `||` delimeter is the target permalink.[m
[32m+[m[32m# Value after `||` delimeter is the title and aria-label name.[m
[32m+[m[32m#github_banner: https://github.com/yourname || Follow me on GitHub[m
 [m
 # Blog rolls[m
 links_icon: link[m
[36m@@ -153,16 +199,21 @@[m [mlinks_title: 友情链接[m
 links_layout: block[m
 #links_layout: inline[m
 links:[m
[32m+[m[32m  #Title: http://example.com/[m
   肖楚天的博客: https://xiaochutian.github.io/[m
 [m
 # Sidebar Avatar[m
[31m-# in theme directory(source/images): /images/avatar.gif[m
[31m-# in site  directory(source/uploads): /uploads/avatar.gif[m
[31m-avatar: /uploads/avatar-wen.jpg[m
[31m-[m
[31m-# 文章末尾添加“本文结束”标记[m
[31m-passage_end_tag:[m
[31m-  enabled: true[m
[32m+[m[32mavatar:[m
[32m+[m[32m  # in theme directory(source/images): /images/avatar.gif[m
[32m+[m[32m  # in site  directory(source/uploads): /uploads/avatar.gif[m
[32m+[m[32m  # You can also use other linking images.[m
[32m+[m[32m  url: /uploads/avatar-wen.jpg #/images/avatar.gif[m
[32m+[m[32m  # If true, the avatar would be dispalyed in circle.[m
[32m+[m[32m  rounded: false[m
[32m+[m[32m  # The value of opacity should be choose from 0 to 1 to set the opacity of the avatar.[m
[32m+[m[32m  opacity: 1[m
[32m+[m[32m  # If true, the avatar would be rotated with the cursor.[m
[32m+[m[32m  rotated: false[m
 [m
 # Table Of Contents in the Sidebar[m
 toc:[m
[36m@@ -182,8 +233,8 @@[m [mtoc:[m
 [m
 sidebar:[m
   # Sidebar Position, available value: left | right (only for Pisces | Gemini).[m
[31m-  position: left[m
[31m-  # position: right[m
[32m+[m[32m  # position: left[m
[32m+[m[32m  position: right[m
 [m
   # Sidebar Display, available value (only for Muse | Mist):[m
   #  - post    expand on posts automatically. Default.[m
[36m@@ -202,7 +253,7 @@[m [msidebar:[m
   b2t: false[m
 [m
   # Scroll percent label in b2t button.[m
[31m-  scrollpercent: true[m
[32m+[m[32m  scrollpercent: false[m
 [m
   # Enable sidebar on narrow view (only for Muse | Mist).[m
   onmobile: false[m
[36m@@ -231,17 +282,32 @@[m [mauto_excerpt:[m
 post_meta:[m
   item_text: true[m
   created_at: true[m
[31m-  updated_at: true[m
[32m+[m[32m  updated_at:[m
[32m+[m[32m    enabled: true[m
[32m+[m[32m    # If true, show updated date label only if `updated date` different from 'created date' (post edited in another day than was created).[m
[32m+[m[32m    # And if post will edited in same day as created, edited time will show in popup title under created time label.[m
[32m+[m[32m    # If false show anyway, but if post edited in same day, show only edited time.[m
[32m+[m[32m    another_day: true[m
   categories: true[m
 [m
 # Post wordcount display settings[m
[31m-# Dependencies: https://github.com/willin/hexo-wordcount[m
[31m-post_wordcount:[m
[31m-  item_text: true[m
[31m-  wordcount: true[m
[31m-  min2read: true[m
[31m-  totalcount: true[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/hexo-symbols-count-time[m
[32m+[m[32msymbols_count_time:[m
   separated_meta: true[m
[32m+[m[32m  item_text_post: true[m
[32m+[m[32m  item_text_total: true[m
[32m+[m[32m  awl: 4[m
[32m+[m[32m  wpm: 275[m
[32m+[m
[32m+[m[32mcodeblock:[m
[32m+[m[32m  # Manual define the border radius in codeblock[m
[32m+[m[32m  # Leave it empty for the default 1[m
[32m+[m[32m  border_radius:[m
[32m+[m[32m  # Add copy button on codeblock[m
[32m+[m[32m  copy_button:[m
[32m+[m[32m    enable: false[m
[32m+[m[32m    # Show text copy result[m
[32m+[m[32m    show_result: false[m
 [m
 # Wechat Subscriber[m
 #wechat_subscriber:[m
[36m@@ -255,11 +321,30 @@[m [mwechatpay: /uploads/wechatpay.jpg[m
 alipay: /uploads/alipay.jpg[m
 #bitcoin: /images/bitcoin.png[m
 [m
[32m+[m[32m# Related popular posts[m
[32m+[m[32m# Dependencies: https://github.com/tea3/hexo-related-popular-posts[m
[32m+[m[32mrelated_posts:[m
[32m+[m[32m  enable: false[m
[32m+[m[32m  title: # custom header, leave empty to use the default one[m
[32m+[m[32m  display_in_home: false[m
[32m+[m[32m  params:[m
[32m+[m[32m    maxCount: 5[m
[32m+[m[32m    #PPMixingRate: 0.0[m
[32m+[m[32m    #isDate: false[m
[32m+[m[32m    #isImage: false[m
[32m+[m[32m    #isExcerpt: false[m
[32m+[m
 # Declare license on posts[m
 post_copyright:[m
[32m+[m[32m  enable: true[m
[32m+[m[32m  license: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" rel="external nofollow" target="_blank">CC BY-NC-SA 4.0</a>[m
[32m+[m
[32m+[m[32m# Post edit[m
[32m+[m[32m# Dependencies: https://github.com/hexojs/hexo-deployer-git[m
[32m+[m[32mpost_edit:[m
   enable: false[m
[31m-  license: CC BY-NC-SA 3.0[m
[31m-  license_url: https://creativecommons.org/licenses/by-nc-sa/3.0/[m
[32m+[m[32m  url: https://github.com/theme-next/theme-next.org/_posts/tree/master/ # Link for view source.[m
[32m+[m[32m# url: https://github.com/theme-next/theme-next.org/_posts/edit/master/ # Link for fork & edit.[m
 [m
 [m
 # ---------------------------------------------------------------[m
[36m@@ -269,7 +354,7 @@[m [mpost_copyright:[m
 # Reduce padding / margin indents on devices with narrow width.[m
 mobile_layout_economy: false[m
 [m
[31m-# Android Chrome header panel color ($black-deep).[m
[32m+[m[32m# Android Chrome header panel color ($brand-bg / $headband-bg => $black-deep).[m
 android_chrome_color: "#222"[m
 [m
 # Custom Logo.[m
[36m@@ -282,11 +367,22 @@[m [mcustom_logo:[m
   image:[m
 [m
 # Code Highlight theme[m
[31m-# Available value:[m
[31m-#    normal | night | night eighties | night blue | night bright[m
[32m+[m[32m# Available values: normal | night | night eighties | night blue | night bright[m
 # https://github.com/chriskempson/tomorrow-theme[m
 highlight_theme: normal[m
 [m
[32m+[m[32m# Enable "cheers" for archive page.[m
[32m+[m[32mcheers_enabled: true[m
[32m+[m
[32m+[m[32m# Manual define the max content width[m
[32m+[m[32m# !!Only available for Gemini Scheme currently[m
[32m+[m[32m# Leave it empty for the default 75% (suggest not less than 1000px)[m
[32m+[m[32m#max_content_width: 1000px[m
[32m+[m
[32m+[m[32m# Manual define the sidebar width[m
[32m+[m[32m# !!Only available for Gemini Scheme currently[m
[32m+[m[32m# Leave it empty for the default 240[m
[32m+[m[32msidebar_width:[m
 [m
 # ---------------------------------------------------------------[m
 # Font Settings[m
[36m@@ -311,13 +407,13 @@[m [mfont:[m
   # `family: Times New Roman`. Without any quotes.[m
   # `size: xx`. Use `px` as unit.[m
 [m
[31m-  # Global font settings used on <body> element.[m
[32m+[m[32m  # Global font settings used for all elements in <body>.[m
   global:[m
     external: true[m
     family: Lato[m
     size:[m
 [m
[31m-  # Font settings for Headlines (h1, h2, h3, h4, h5, h6).[m
[32m+[m[32m  # Font settings for Headlines (H1, H2, H3, H4, H5, H6).[m
   # Fallback to `global` font settings.[m
   headings:[m
     external: true[m
[36m@@ -348,32 +444,60 @@[m [mfont:[m
 # Third Party Services Settings[m
 # ---------------------------------------------------------------[m
 [m
[31m-# MathJax Support[m
[31m-mathjax:[m
[32m+[m[32m# Math Equations Render Support[m
[32m+[m[32mmath:[m
   enable: false[m
[31m-  per_page: false[m
[31m-  cdn: //cdn.bootcss.com/mathjax/2.7.1/latest.js?config=TeX-AMS-MML_HTMLorMML[m
 [m
[31m-# Han Support docs: https://hanzi.pro/[m
[32m+[m[32m  # Default(true) will load mathjax/katex script on demand[m
[32m+[m[32m  # That is it only render those page who has 'mathjax: true' in Front Matter.[m
[32m+[m[32m  # If you set it to false, it will load mathjax/katex srcipt EVERY PAGE.[m
[32m+[m[32m  per_page: true[m
[32m+[m
[32m+[m[32m  engine: mathjax[m
[32m+[m[32m  #engine: katex[m
[32m+[m
[32m+[m[32m  # hexo-rendering-pandoc (or hexo-renderer-kramed) needed to full MathJax support.[m
[32m+[m[32m  mathjax:[m
[32m+[m[32m    # Use 2.7.1 as default, jsdelivr as default CDN, works everywhere even in China[m
[32m+[m[32m    cdn: //cdn.jsdelivr.net/npm/mathjax@2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML[m
[32m+[m[32m    # For newMathJax CDN (cdnjs.cloudflare.com) with fallback to oldMathJax (cdn.mathjax.org).[m
[32m+[m[32m    #cdn: //cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML[m
[32m+[m[32m    # For direct link to MathJax.js with CloudFlare CDN (cdnjs.cloudflare.com).[m
[32m+[m[32m    #cdn: //cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML[m
[32m+[m[32m    # For automatic detect latest version link to MathJax.js and get from Bootcss.[m
[32m+[m[32m    #cdn: //cdn.bootcss.com/mathjax/2.7.1/latest.js?config=TeX-AMS-MML_HTMLorMML[m
[32m+[m
[32m+[m[32m  # hexo-renderer-markdown-it-plus (or hexo-renderer-markdown-it with markdown-it-katex plugin)[m
[32m+[m[32m  # needed to full Katex support.[m
[32m+[m[32m  katex:[m
[32m+[m[32m    # Use 0.7.1 as default, jsdelivr as default CDN, works everywhere even in China[m
[32m+[m[32m    cdn: //cdn.jsdelivr.net/npm/katex@0.7.1/dist/katex.min.css[m
[32m+[m[32m    # CDNJS, provided by cloudflare, maybe the best CDN, but not works in China[m
[32m+[m[32m    #cdn: //cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css[m
[32m+[m[32m    # Bootcss, works great in China, but not so well in other region[m
[32m+[m[32m    #cdn: //cdn.bootcss.com/KaTeX/0.7.1/katex.min.css[m
[32m+[m
[32m+[m[32m# Han Support[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-han[m
 han: false[m
 [m
[32m+[m[32m# Pangu Support[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-pangu[m
[32m+[m[32m# For more information: https://github.com/vinta/pangu.js[m
[32m+[m[32mpangu: false[m
[32m+[m
 # Swiftype Search API Key[m
 #swiftype_key:[m
 [m
 # Baidu Analytics ID[m
[31m-[m
[31m-# Analytics settings[m
[31m-# Baidu Analytics[m
 baidu_analytics: 0ee846e1ba3a25130ad41180a73f6f9a[m
 [m
[31m-# Duoshuo ShortName[m
[31m-#duoshuo_shortname:[m
[31m-[m
 # Disqus[m
 disqus:[m
   enable: false[m
   shortname: wenzhiquan[m
   count: true[m
[32m+[m[32m  lazyload: false[m
 [m
 # Hypercomments[m
 #hypercomments_id:[m
[36m@@ -410,7 +534,6 @@[m [mvaline:[m
 [m
 # Gitment[m
 # Introduction: https://imsun.net/posts/gitment-introduction/[m
[31m-# You can get your Github ID from https://api.github.com/users/<Github username>[m
 gitment:[m
   enable: false[m
   mint: true # RECOMMEND, A mint on Gitment, to support count, language and proxy_gateway[m
[36m@@ -418,8 +541,8 @@[m [mgitment:[m
   lazy: false # Comments lazy loading with a button[m
   cleanly: false # Hide 'Powered by ...' on footer, and more[m
   language: # Force language, or auto switch by theme[m
[31m-  github_user: # MUST HAVE, Your Github ID[m
[31m-  github_repo: # MUST HAVE, The repo you use to store Gitment comments[m
[32m+[m[32m  github_user: # MUST HAVE, Your Github Username[m
[32m+[m[32m  github_repo: # MUST HAVE, The name of the repo you use to store Gitment comments[m
   client_id: # MUST HAVE, Github client id for the Gitment[m
   client_secret: # EITHER this or proxy_gateway, Github access secret token for the Gitment[m
   proxy_gateway: # Address of api proxy, See: https://github.com/aimingoo/intersect[m
[36m@@ -436,15 +559,13 @@[m [mgitment:[m
 # This plugin is more useful in China, make sure you known how to use it.[m
 # And you can find the use guide at official webiste: http://www.jiathis.com/.[m
 # Warning: JiaThis does not support https.[m
[31m-# jiathis:[m
[32m+[m[32m#jiathis:[m
   ##uid: Get this uid from http://www.jiathis.com/[m
[31m-#add_this_id:[m
 [m
[31m-# Share[m
[31m-#duoshuo_share: true[m
[32m+[m[32m#add_this_id:[m
 [m
 # NeedMoreShare2[m
[31m-# This plugin is a pure javascript sharing lib which is useful in China.[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-needmoreshare2[m
 # See: https://github.com/revir/need-more-share2[m
 # Also see: https://github.com/DzmVasileusky/needShareButton[m
 # iconStyle: default | box[m
[36m@@ -493,15 +614,6 @@[m [mgoogle_analytics: 'UA-75727255-1'[m
 # See https://azure.microsoft.com/en-us/services/application-insights/[m
 # application_insights:[m
 [m
[31m-# Make duoshuo show UA[m
[31m-# user_id must NOT be null when admin_enable is true![m
[31m-# you can visit http://dev.duoshuo.com get duoshuo user id.[m
[31m-duoshuo_info:[m
[31m-  ua_enable: true[m
[31m-  admin_enable: false[m
[31m-  user_id: 0[m
[31m-  #admin_nickname: Author[m
[31m-[m
 # Post widgets & FB/VK comments settings.[m
 # ---------------------------------------------------------------[m
 # Facebook SDK Support.[m
[36m@@ -535,7 +647,7 @@[m [mvkontakte_api:[m
 # To get your ID visit https://widgetpack.com[m
 rating:[m
   enable: false[m
[31m-  id:     11264[m
[32m+[m[32m  id:     11264 #<app_id>[m
   color:  fc6423[m
 # ---------------------------------------------------------------[m
 [m
[36m@@ -543,8 +655,13 @@[m [mrating:[m
 # You can visit https://leancloud.cn get AppID and AppKey.[m
 leancloud_visitors:[m
   enable: true[m
[31m-  app_id: xSt4331oBR0VyC2jUzPEuxxh-gzGzoHsz[m
[31m-  app_key: t2TehJbxap2pAcoBr4oCrCtT[m
[32m+[m[32m  app_id: xSt4331oBR0VyC2jUzPEuxxh-gzGzoHsz #<app_id>[m
[32m+[m[32m  app_key: t2TehJbxap2pAcoBr4oCrCtT #<app_key>[m
[32m+[m[32m  # Dependencies: https://github.com/theme-next/hexo-leancloud-counter-security[m
[32m+[m[32m  # If you don't care about security in lc counter and just want to use it directly[m
[32m+[m[32m  # (without hexo-leancloud-counter-security plugin), set the `security` to `false`.[m
[32m+[m[32m  security: true[m
[32m+[m[32m  betterPerformance: true[m
 [m
 # Another tool to show number of visitors to each article.[m
 # visit https://console.firebase.google.com/u/0/ to get apiKey and projectId[m
[36m@@ -556,23 +673,16 @@[m [mfirestore:[m
   projectId: #required[m
   bluebird: false #enable this if you want to include bluebird 3.5.1(core version) Promise polyfill[m
 [m
[31m-# Show PV/UV of the website/page with busuanzi.[m
[32m+[m[32m# Show Views/Visitors of the website/page with busuanzi.[m
 # Get more information on http://ibruce.info/2015/04/04/busuanzi/[m
 busuanzi_count:[m
[31m-  # count values only if the other configs are false[m
[31m-  enable: false[m
[31m-  # custom uv span for the whole site[m
[31m-  site_uv: true[m
[31m-  site_uv_header: <i class="fa fa-user"></i>[m
[31m-  site_uv_footer:[m
[31m-  # custom pv span for the whole site[m
[31m-  site_pv: true[m
[31m-  site_pv_header: <i class="fa fa-eye"></i>[m
[31m-  site_pv_footer:[m
[31m-  # custom pv span for one page only[m
[31m-  page_pv: true[m
[31m-  page_pv_header: <i class="fa fa-file-o"></i>[m
[31m-  page_pv_footer:[m
[32m+[m[32m  enable: true[m
[32m+[m[32m  total_visitors: true[m
[32m+[m[32m  total_visitors_icon: user[m
[32m+[m[32m  total_views: true[m
[32m+[m[32m  total_views_icon: eye[m
[32m+[m[32m  post_views: true[m
[32m+[m[32m  post_views_icon: eye[m
 [m
 [m
 # Tencent analytics ID[m
[36m@@ -603,6 +713,8 @@[m [mcalendar:[m
   maxResults: 250[m
 [m
 # Algolia Search[m
[32m+[m[32m# See: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ALGOLIA-SEARCH.md[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-algolia-instant-search[m
 algolia_search:[m
   enable: false[m
   hits:[m
[36m@@ -613,7 +725,7 @@[m [malgolia_search:[m
     hits_stats: "${hits} results found in ${time} ms"[m
 [m
 # Local search[m
[31m-# Dependencies: https://github.com/flashlab/hexo-generator-search[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/hexo-generator-searchdb[m
 local_search:[m
   enable: true[m
   # if auto, trigger search by changing input[m
[36m@@ -621,6 +733,18 @@[m [mlocal_search:[m
   trigger: auto[m
   # show top n results per article, show all results by setting to -1[m
   top_n_per_article: 10[m
[32m+[m[32m  # unescape html strings to the readable one[m
[32m+[m[32m  unescape: false[m
[32m+[m
[32m+[m[32m# Bookmark Support[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-bookmark[m
[32m+[m[32mbookmark:[m
[32m+[m[32m  enable: true[m
[32m+[m[32m  # if auto[m
[32m+[m[32m  #   - save the reading position when closing the page[m
[32m+[m[32m  #   - or clicking the bookmark-icon[m
[32m+[m[32m  # if manual, only save it by clicking the bookmark-icon[m
[32m+[m[32m  save: auto[m
 [m
 [m
 # ---------------------------------------------------------------[m
[36m@@ -657,6 +781,13 @@[m [mtabs:[m
     labels: true[m
   border_radius: 0[m
 [m
[32m+[m[32m# Reading progress bar[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-reading-progress[m
[32m+[m[32mreading_progress:[m
[32m+[m[32m  enable: false[m
[32m+[m[32m  color: "#37c6c0"[m
[32m+[m[32m  height: 2px[m
[32m+[m
 [m
 #! ---------------------------------------------------------------[m
 #! DO NOT EDIT THE FOLLOWING SETTINGS[m
[36m@@ -682,10 +813,22 @@[m [mmotion:[m
     # Only for Pisces | Gemini.[m
     sidebar: slideUpIn[m
 [m
[31m-# Fancybox[m
[31m-fancybox: true[m
[32m+[m[32m# Fancybox. There is support for old version 2 and new version 3.[m
[32m+[m[32m# Please, choose only any one variant, do not need to install both.[m
[32m+[m[32m# For install 2.x: https://github.com/theme-next/theme-next-fancybox[m
[32m+[m[32m# For install 3.x: https://github.com/theme-next/theme-next-fancybox3[m
[32m+[m[32mfancybox: false[m
[32m+[m
[32m+[m[32m# Added switch option for separated repo in 6.0.0.[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-fastclick[m
[32m+[m[32mfastclick: false[m
[32m+[m
[32m+[m[32m# Added switch option for separated repo in 6.0.0.[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-jquery-lazyload[m
[32m+[m[32mlazyload: false[m
 [m
 # Progress bar in the top during page loading.[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-pace[m
 pace: true[m
 # Themes list:[m
 #pace-theme-big-counter[m
[36m@@ -706,18 +849,20 @@[m [mpace: true[m
 pace_theme: pace-theme-minimal[m
 [m
 # Canvas-nest[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-canvas-nest[m
 canvas_nest: true[m
 [m
[32m+[m[32m# JavaScript 3D library.[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-three[m
 # three_waves[m
 three_waves: false[m
[31m-[m
 # canvas_lines[m
 canvas_lines: false[m
[31m-[m
 # canvas_sphere[m
 canvas_sphere: false[m
 [m
 # Only fit scheme Pisces[m
[32m+[m[32m# Dependencies: https://github.com/theme-next/theme-next-canvas-ribbon[m
 # Canvas-ribbon[m
 # size: The width of the ribbon.[m
 # alpha: The transparency of the ribbon.[m
[36m@@ -808,21 +953,34 @@[m [mvendors:[m
 [m
   # Internal version: 3.3.0[m
   # https://github.com/ethantw/Han[m
[31m-  han:[m
[32m+[m[32m  Han:[m
[32m+[m
[32m+[m[32m  # Internal version: 3.3.0[m
[32m+[m[32m  # https://github.com/vinta/pangu.js[m
[32m+[m[32m  pangu:[m
 [m
   # needMoreShare2[m
   # https://github.com/revir/need-more-share2[m
[31m-  needMoreShare2:[m
[32m+[m[32m  needmoreshare2_js:[m
[32m+[m[32m  needmoreshare2_css:[m
[32m+[m
[32m+[m[32m  # bookmark[m
[32m+[m[32m  # Internal version: 1.0.0[m
[32m+[m[32m  # https://github.com/theme-next/theme-next-bookmark[m
[32m+[m[32m  bookmark:[m
[32m+[m
[32m+[m[32m  # reading_progress[m
[32m+[m[32m  # Internal version: 1.0[m
[32m+[m[32m  # https://github.com/theme-next/theme-next-reading-progress[m
[32m+[m[32m  # Example: https://cdn.jsdelivr.net/gh/theme-next/theme-next-reading-progress@1.1/reading_progress.min.js[m
[32m+[m[32m  reading_progress:[m
[32m+[m
[32m+[m[32m  # valine comment[m
[32m+[m[32m  # Example: https://cdn.jsdelivr.net/npm/valine@1.1.8/dist/Valine.min.js[m
[32m+[m[32m  valine:[m
 [m
 [m
 # Assets[m
 css: css[m
 js: js[m
 images: images[m
[31m-[m
[31m-# Theme version[m
[31m-version: 5.1.4[m
[31m-[m
[31m-# Online contact[m
[31m-daovoice: false[m
[31m-daovoice_app_id: 5ad7a912[m
[1mdiff --git a/themes/next/bower.json b/themes/next/bower.json[m
[1mindex d884845..0354dc0 100644[m
[1m--- a/themes/next/bower.json[m
[1m+++ b/themes/next/bower.json[m
[36m@@ -1,20 +1,18 @@[m
 {[m
[31m-  "name": "isn-next",[m
[31m-  "version": "5.1.4",[m
[31m-  "homepage": "https://github.com/iissnan/hexo-theme-next",[m
[32m+[m[32m  "name": "theme-next",[m
[32m+[m[32m  "version": "6.3.0",[m
[32m+[m[32m  "homepage": "https://theme-next.org",[m
   "authors": [[m
[31m-    "iissnan <iissnan@gmail.com>"[m
[32m+[m[32m    "NexT <support@theme-next.org> (https://theme-next.org)"[m
   ],[m
   "description": "Elegant theme for Hexo",[m
[31m-  "repository": "https://github.com/iissnan/hexo-theme-next",[m
[32m+[m[32m  "repository": "https://github.com/theme-next/hexo-theme-next",[m
   "keywords": [[m
     "hexo",[m
[31m-    "notes",[m
     "theme",[m
[31m-    "iissnan",[m
[31m-    "NexT"[m
[32m+[m[32m    "next"[m
   ],[m
[31m-  "license": "MIT",[m
[32m+[m[32m  "license": "AGPL",[m
   "ignore": [[m
     "**/.*",[m
     "node_modules",[m
[36m@@ -25,13 +23,9 @@[m
     "screenshots"[m
   ],[m
   "dependencies": {[m
[31m-    "fancybox": "~2.1.5",[m
[31m-    "velocity": "~1.2.1",[m
[31m-    "jquery": "http://code.jquery.com/jquery-2.1.3.min.js",[m
[31m-    "fastclick": "~1.0.6",[m
     "font-awesome": "fontawesome#*",[m
[31m-    "jquery_lazyload": "jquery.lazyload#~1.9.7",[m
[32m+[m[32m    "jquery": "http://code.jquery.com/jquery-2.1.3.min.js",[m
     "ua-parser-js": "~0.7.9",[m
[31m-    "Han": "^3.3.0"[m
[32m+[m[32m    "velocity": "~1.2.1"[m
   }[m
 }[m
[1mdiff --git a/themes/next/gulpfile.coffee b/themes/next/gulpfile.coffee[m
[1mindex c7d706b..77970d3 100644[m
[1m--- a/themes/next/gulpfile.coffee[m
[1m+++ b/themes/next/gulpfile.coffee[m
[36m@@ -10,7 +10,6 @@[m [mgulp.task 'lint', ->[m
   return gulp.src([[m
     './source/js/src/utils.js',[m
     './source/js/src/motion.js',[m
[31m-    './source/js/src/hook-duoshuo.js',[m
     './source/js/src/algolia-search.js',[m
     './source/js/src/bootstrap.js',[m
     './source/js/src/post-details.js',[m
[1mdiff --git a/themes/next/languages/de.yml b/themes/next/languages/de.yml[m
[1mindex 8c74a69..5305d66 100644[m
[1m--- a/themes/next/languages/de.yml[m
[1m+++ b/themes/next/languages/de.yml[m
[36m@@ -1,73 +1,73 @@[m
[32m+[m[32m---[m
 title:[m
   archive: Archiv[m
   category: Kategorie[m
   tag: Tag[m
[31m-[m
[31m-author: Author[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
 menu:[m
   home: Startseite[m
   archives: Archiv[m
   categories: Kategorien[m
   tags: Tags[m
   about: Über[m
[31m-  feed: RSS[m
   search: Suche[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
[32m+[m[32m  sitemap: Sitemap[m
[32m+[m[32m  commonweal: Commonweal 404[m
 sidebar:[m
   overview: Übersicht[m
   toc: Inhaltsverzeichnis[m
[31m-[m
 post:[m
[31m-  created: Post created[m
[31m-  sticky: Sticky[m
   posted: Veröffentlicht am[m
[32m+[m[32m  edited: Edited on[m
[32m+[m[32m  created: Post created[m
   modified: Updated at[m
[32m+[m[32m  edit: Edit this post[m
   in: in[m
[32m+[m[32m  more: more[m
   read_more: Weiterlesen[m
   untitled: Unbenannt[m
[32m+[m[32m  sticky: Sticky[m
   toc_empty: Dieser Artikel hat kein Inhaltsverzeichnis[m
[31m-  visitors: Visitors[m
[31m-  wordcount: Words count in article[m
[31m-  min2read: Reading time[m
[31m-  totalcount: Site words total count[m
[32m+[m[32m  views: Views[m
[32m+[m[32m  comments_count: Comments[m
[32m+[m[32m  related_posts: Related Posts[m
[32m+[m[32m  copy_button: Copy[m
[32m+[m[32m  copy_success: Copied[m
[32m+[m[32m  copy_failure: Copy failed[m
   copyright:[m
     author: Post author[m
     link: Post link[m
     license_title: Copyright Notice[m
[31m-    license_content: 'All articles in this blog are licensed under[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> unless stating additionally.'[m
[31m-[m
[32m+[m[32m    license_content: "All articles in this blog are licensed under %s unless stating additionally."[m
 page:[m
   totally: Gesamt[m
   tags: tags[m
[31m-[m
 footer:[m
   powered: "Erstellt mit  %s"[m
   theme: Theme[m
[31m-[m
[32m+[m[32m  total_views: Total Views[m
[32m+[m[32m  total_visitors: Total Visitors[m
 counter:[m
   tag_cloud:[m
     zero: Keine Tags[m
     one: Insgesamt ein Tag[m
     other: "Insgesamt %d Tags"[m
[31m-[m
   categories:[m
     zero: Keine Kategorien[m
     one: Insgesamt eine Kategorie[m
     other: "Insgesamt %d Kategorien"[m
[31m-[m
   archive_posts:[m
     zero: Keine Artikel vorhanden.[m
     one: Ein Artikel.[m
     other: "Insgesamt %d Artikel."[m
[31m-[m
 state:[m
   posts: Artikel[m
   pages: Seiten[m
   tags: Tags[m
   categories: Kategorien[m
[31m-[m
[32m+[m[32msearch:[m
[32m+[m[32m  placeholder: Searching...[m
 cheers:[m
   um: Öhm..[m
   ok: OK[m
[36m@@ -75,16 +75,24 @@[m [mcheers:[m
   good: Gut[m
   great: Wunderbar[m
   excellent: Exzellent[m
[31m-[m
 keep_on: Bleib dran.[m
[31m-[m
 symbol:[m
[31m-  comma: '. '[m
[31m-  period: ', '[m
[31m-  colon: ':'[m
[31m-[m
[32m+[m[32m  comma: ". "[m
[32m+[m[32m  period: ", "[m
[32m+[m[32m  colon: ": "[m
 reward:[m
   donate: Donate[m
   wechatpay: WeChat Pay[m
   alipay: Alipay[m
   bitcoin: Bitcoin[m
[32m+[m[32mgitmentbutton: Show comments from Gitment[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Toggle navigation bar[m
[32m+[m[32m  prev_page: Previous page[m
[32m+[m[32m  next_page: Next page[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Symbols count in article[m
[32m+[m[32m  count_total: Symbols count total[m
[32m+[m[32m  time: Reading time[m
[32m+[m[32m  time_total: Reading time total[m
[32m+[m[32m  time_minutes: mins.[m
[1mdiff --git a/themes/next/languages/default.yml b/themes/next/languages/default.yml[m
[1mdeleted file mode 100644[m
[1mindex b1fec61..0000000[m
[1m--- a/themes/next/languages/default.yml[m
[1m+++ /dev/null[m
[36m@@ -1,97 +0,0 @@[m
[31m-title:[m
[31m-  archive: Archive[m
[31m-  category: Category[m
[31m-  tag: Tag[m
[31m-  schedule: Schedule[m
[31m-[m
[31m-author: Author[m
[31m-[m
[31m-menu:[m
[31m-  home: Home[m
[31m-  archives: Archives[m
[31m-  categories: Categories[m
[31m-  tags: Tags[m
[31m-  about: About[m
[31m-  search: Search[m
[31m-  schedule: Schedule[m
[31m-  sitemap: Sitemap[m
[31m-  commonweal: Commonweal 404[m
[31m-[m
[31m-sidebar:[m
[31m-  overview: Overview[m
[31m-  toc: Table of Contents[m
[31m-[m
[31m-post:[m
[31m-  created: Post created[m
[31m-  modified: Post modified[m
[31m-  sticky: Sticky[m
[31m-  posted: Posted on[m
[31m-  in: In[m
[31m-  more: more[m
[31m-  read_more: Read more[m
[31m-  untitled: Untitled[m
[31m-  toc_empty: This post does not have a Table of Contents[m
[31m-  visitors: Visitors[m
[31m-  wordcount: Words count in article[m
[31m-  min2read: Reading time[m
[31m-  totalcount: Site words total count[m
[31m-  copyright:[m
[31m-    author: Post author[m
[31m-    link: Post link[m
[31m-    license_title: Copyright Notice[m
[31m-    license_content: 'All articles in this blog are licensed under[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> unless stating additionally.'[m
[31m-[m
[31m-page:[m
[31m-  totally: Totally[m
[31m-  tags: tags[m
[31m-[m
[31m-footer:[m
[31m-  powered: "Powered by %s"[m
[31m-  theme: Theme[m
[31m-[m
[31m-counter:[m
[31m-  tag_cloud:[m
[31m-    zero: No tags[m
[31m-    one: 1 tag in total[m
[31m-    other: "%d tags in total"[m
[31m-[m
[31m-  categories:[m
[31m-    zero: No categories[m
[31m-    one: 1 category in total[m
[31m-    other: "%d categories in total"[m
[31m-[m
[31m-  archive_posts:[m
[31m-    zero: No posts.[m
[31m-    one: 1 post.[m
[31m-    other: "%d posts in total."[m
[31m-[m
[31m-state:[m
[31m-  posts: posts[m
[31m-  pages: pages[m
[31m-  tags: tags[m
[31m-  categories: categories[m
[31m-[m
[31m-search:[m
[31m-  placeholder: Searching...[m
[31m-[m
[31m-cheers:[m
[31m-  um: Um..[m
[31m-  ok: OK[m
[31m-  nice: Nice[m
[31m-  good: Good[m
[31m-  great: Great[m
[31m-  excellent: Excellent[m
[31m-[m
[31m-keep_on: Keep on posting.[m
[31m-[m
[31m-symbol:[m
[31m-  comma: ', '[m
[31m-  period: '. '[m
[31m-  colon: ':'[m
[31m-[m
[31m-reward:[m
[31m-  donate: Donate[m
[31m-  wechatpay: WeChat Pay[m
[31m-  alipay: Alipay[m
[31m-  bitcoin: Bitcoin[m
[1mdiff --git a/themes/next/languages/default.yml b/themes/next/languages/default.yml[m
[1mnew file mode 120000[m
[1mindex 0000000..7fcfc3b[m
[1m--- /dev/null[m
[1m+++ b/themes/next/languages/default.yml[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32men.yml[m
\ No newline at end of file[m
[1mdiff --git a/themes/next/languages/en.yml b/themes/next/languages/en.yml[m
[1mindex 37fe1db..ed25551 100644[m
[1m--- a/themes/next/languages/en.yml[m
[1m+++ b/themes/next/languages/en.yml[m
[36m@@ -4,8 +4,6 @@[m [mtitle:[m
   tag: Tag[m
   schedule: Schedule[m
 [m
[31m-author: Author[m
[31m-[m
 menu:[m
   home: Home[m
   archives: Archives[m
[36m@@ -22,25 +20,28 @@[m [msidebar:[m
   toc: Table of Contents[m
 [m
 post:[m
[31m-  created: Post created[m
[31m-  modified: Post modified[m
[31m-  sticky: Sticky[m
   posted: Posted on[m
[32m+[m[32m  edited: Edited on[m
[32m+[m[32m  created: Created[m
[32m+[m[32m  modified: Modified[m
[32m+[m[32m  edit: Edit this post[m
   in: In[m
   more: more[m
   read_more: Read more[m
   untitled: Untitled[m
[32m+[m[32m  sticky: Sticky[m
   toc_empty: This post does not have a Table of Contents[m
[31m-  visitors: Visitors[m
[31m-  wordcount: Words count in article[m
[31m-  min2read: Reading time[m
[31m-  totalcount: Site words total count[m
[32m+[m[32m  views: Views[m
[32m+[m[32m  comments_count: Comments[m
[32m+[m[32m  related_posts: Related Posts[m
[32m+[m[32m  copy_button: Copy[m
[32m+[m[32m  copy_success: Copied[m
[32m+[m[32m  copy_failure: Copy failed[m
   copyright:[m
     author: Post author[m
     link: Post link[m
     license_title: Copyright Notice[m
[31m-    license_content: 'All articles in this blog are licensed under[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> unless stating additionally.'[m
[32m+[m[32m    license_content: "All articles in this blog are licensed under %s unless stating additionally."[m
 [m
 page:[m
   totally: Totally[m
[36m@@ -49,6 +50,8 @@[m [mpage:[m
 footer:[m
   powered: "Powered by %s"[m
   theme: Theme[m
[32m+[m[32m  total_views: Total Views[m
[32m+[m[32m  total_visitors: Total Visitors[m
 [m
 counter:[m
   tag_cloud:[m
[36m@@ -86,9 +89,9 @@[m [mcheers:[m
 keep_on: Keep on posting.[m
 [m
 symbol:[m
[31m-  comma: ', '[m
[31m-  period: '. '[m
[31m-  colon: ':'[m
[32m+[m[32m  comma: ", "[m
[32m+[m[32m  period: ". "[m
[32m+[m[32m  colon: ": "[m
 [m
 reward:[m
   donate: Donate[m
[36m@@ -97,3 +100,15 @@[m [mreward:[m
   bitcoin: Bitcoin[m
 [m
 gitmentbutton: Show comments from Gitment[m
[32m+[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Toggle navigation bar[m
[32m+[m[32m  prev_page: Previous page[m
[32m+[m[32m  next_page: Next page[m
[32m+[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Symbols count in article[m
[32m+[m[32m  count_total: Symbols count total[m
[32m+[m[32m  time: Reading time[m
[32m+[m[32m  time_total: Reading time total[m
[32m+[m[32m  time_minutes: mins.[m
[1mdiff --git a/themes/next/languages/id.yml b/themes/next/languages/id.yml[m
[1mindex 0e81fe4..3eb1913 100644[m
[1m--- a/themes/next/languages/id.yml[m
[1m+++ b/themes/next/languages/id.yml[m
[36m@@ -1,10 +1,9 @@[m
[32m+[m[32m---[m
 title:[m
   archive: Arsip[m
   category: Kategori[m
   tag: Tag[m
[31m-[m
[31m-author: Penulis[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
 menu:[m
   home: Beranda[m
   archives: Arsip[m
[36m@@ -12,60 +11,63 @@[m [mmenu:[m
   tags: Tags[m
   about: Tentang[m
   search: Pencarian[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
[32m+[m[32m  sitemap: Sitemap[m
[32m+[m[32m  commonweal: Commonweal 404[m
 sidebar:[m
   overview: Ikhtisar[m
   toc: Daftar Isi[m
[31m-[m
 post:[m
[31m-  sticky: Sticky[m
   posted: Diposting di[m
[32m+[m[32m  edited: Edited on[m
[32m+[m[32m  created: Post created[m
   modified: Updated at[m
[32m+[m[32m  edit: Edit this post[m
   in: Di[m
[32m+[m[32m  more: more[m
   read_more: Baca lebih[m
   untitled: Tidak ada title[m
[32m+[m[32m  sticky: Sticky[m
   toc_empty: Posting ini tidak memiliki Daftar Isi[m
[31m-  visitors: Pengunjung[m
[31m-  wordcount: Words count in article[m
[31m-  min2read: Reading time[m
[31m-  totalcount: Site words total count[m
[32m+[m[32m  views: Views[m
[32m+[m[32m  comments_count: Comments[m
[32m+[m[32m  related_posts: Related Posts[m
[32m+[m[32m  copy_button: Copy[m
[32m+[m[32m  copy_success: Copied[m
[32m+[m[32m  copy_failure: Copy failed[m
   copyright:[m
     author: Post author[m
     link: Post link[m
     license_title: Copyright Notice[m
[31m-    license_content: 'All articles in this blog are licensed under[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> unless stating additionally.'[m
[31m-[m
[32m+[m[32m    license_content: "All articles in this blog are licensed under %s unless stating additionally."[m
 page:[m
   totally: Total[m
   tags: tags[m
[31m-[m
 footer:[m
   powered: "Powered by %s"[m
   theme: Tema[m
[31m-[m
[32m+[m[32m  total_views: Total Views[m
[32m+[m[32m  total_visitors: Total Visitors[m
 counter:[m
   tag_cloud:[m
     zero: Tidak ada tags[m
     one: 1 total tag[m
     other: "%d total tags"[m
[31m-[m
   categories:[m
     zero: Tidak ada kategori[m
     one: 1 total categori[m
     other: "%d total kategori"[m
[31m-[m
   archive_posts:[m
     zero: Tidak ada posting.[m
     one: 1 posting.[m
     other: "%d total posting."[m
[31m-[m
 state:[m
   posts: posting[m
   pages: halaman[m
   tags: tags[m
   categories: kategori[m
[31m-[m
[32m+[m[32msearch:[m
[32m+[m[32m  placeholder: Searching...[m
 cheers:[m
   um: Um..[m
   ok: OK[m
[36m@@ -73,16 +75,24 @@[m [mcheers:[m
   good: Bagus[m
   great: Besar[m
   excellent: Baik[m
[31m-[m
 keep_on: Terus Posting.[m
[31m-[m
 symbol:[m
[31m-  comma: ', '[m
[31m-  period: '. '[m
[31m-  colon: ':'[m
[31m-[m
[32m+[m[32m  comma: ", "[m
[32m+[m[32m  period: ". "[m
[32m+[m[32m  colon: ": "[m
 reward:[m
   donate: Donate[m
   wechatpay: WeChat Pay[m
   alipay: Alipay[m
   bitcoin: Bitcoin[m
[32m+[m[32mgitmentbutton: Show comments from Gitment[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Toggle navigation bar[m
[32m+[m[32m  prev_page: Previous page[m
[32m+[m[32m  next_page: Next page[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Symbols count in article[m
[32m+[m[32m  count_total: Symbols count total[m
[32m+[m[32m  time: Reading time[m
[32m+[m[32m  time_total: Reading time total[m
[32m+[m[32m  time_minutes: mins.[m
[1mdiff --git a/themes/next/languages/it.yml b/themes/next/languages/it.yml[m
[1mindex 39aa40e..45da05f 100644[m
[1m--- a/themes/next/languages/it.yml[m
[1m+++ b/themes/next/languages/it.yml[m
[36m@@ -1,11 +1,9 @@[m
[32m+[m[32m---[m
 title:[m
   archive: Archivio[m
   category: Categoria[m
   tag: Tag[m
   schedule: Programma[m
[31m-[m
[31m-author: Autore[m
[31m-[m
 menu:[m
   home: Home[m
   archives: Archivi[m
[36m@@ -16,65 +14,60 @@[m [mmenu:[m
   schedule: Programma[m
   sitemap: Sitemap[m
   commonweal: Commonweal 404[m
[31m-[m
 sidebar:[m
   overview: Panoramica[m
   toc: Indice[m
[31m-[m
 post:[m
[32m+[m[32m  posted: Scritto il[m
[32m+[m[32m  edited: Edited on[m
   created: Post creato[m
   modified: Post modificato[m
[31m-  sticky: Sticky[m
[31m-  posted: Scritto il[m
[32m+[m[32m  edit: Edit this post[m
   in: In[m
   more: espandi[m
   read_more: Leggi di più[m
   untitled: Senza titolo[m
[32m+[m[32m  sticky: Sticky[m
   toc_empty: Questo post non ha un indice[m
[31m-  visitors: Visitatori[m
[31m-  wordcount: Numero di parole nell'articolo[m
[31m-  min2read: Tempo di lettura[m
[31m-  totalcount: Numero totale di parole[m
[32m+[m[32m  views: Views[m
[32m+[m[32m  comments_count: Comments[m
[32m+[m[32m  related_posts: Related Posts[m
[32m+[m[32m  copy_button: Copy[m
[32m+[m[32m  copy_success: Copied[m
[32m+[m[32m  copy_failure: Copy failed[m
   copyright:[m
     author: Autore[m
     link: Link[m
     license_title: Copyright[m
[31m-    license_content: 'Tutti gli articoli in questo sito sono sotto licenza[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> salvo disposizione contraria.'[m
[31m-[m
[32m+[m[32m    license_content: "Tutti gli articoli in questo sito sono sotto licenza %s salvo disposizione contraria."[m
 page:[m
   totally: Totale[m
   tags: tags[m
[31m-[m
 footer:[m
   powered: "Powered by %s"[m
   theme: Tema[m
[31m-[m
[32m+[m[32m  total_views: Total Views[m
[32m+[m[32m  total_visitors: Total Visitors[m
 counter:[m
   tag_cloud:[m
     zero: Nessun tag[m
     one: 1 tag in totale[m
     other: "%d tags in totale."[m
[31m-[m
   categories:[m
     zero: Nessuna categoria[m
     one: 1 categoria in totale[m
     other: "%d categorie in totale."[m
[31m-[m
   archive_posts:[m
     zero: Nessun post.[m
     one: 1 post.[m
     other: "%d posts in totale."[m
[31m-[m
 state:[m
   posts: posts[m
   pages: pagine[m
   tags: tags[m
   categories: categorie[m
[31m-[m
 search:[m
   placeholder: Cerca...[m
[31m-[m
 cheers:[m
   um: Mh..[m
   ok: OK[m
[36m@@ -82,16 +75,24 @@[m [mcheers:[m
   good: Buono[m
   great: Ottimo[m
   excellent: Eccellente[m
[31m-[m
 keep_on: Continua così.[m
[31m-[m
 symbol:[m
[31m-  comma: ', '[m
[31m-  period: '. '[m
[31m-  colon: ':'[m
[31m-[m
[32m+[m[32m  comma: ", "[m
[32m+[m[32m  period: ". "[m
[32m+[m[32m  colon: ": "[m
 reward:[m
   donate: Dona[m
   wechatpay: WeChat Pay[m
   alipay: Alipay[m
   bitcoin: Bitcoin[m
[32m+[m[32mgitmentbutton: Show comments from Gitment[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Toggle navigation bar[m
[32m+[m[32m  prev_page: Previous page[m
[32m+[m[32m  next_page: Next page[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Symbols count in article[m
[32m+[m[32m  count_total: Symbols count total[m
[32m+[m[32m  time: Reading time[m
[32m+[m[32m  time_total: Reading time total[m
[32m+[m[32m  time_minutes: mins.[m
[1mdiff --git a/themes/next/languages/ja.yml b/themes/next/languages/ja.yml[m
[1mindex 990e5f2..7935e8b 100644[m
[1m--- a/themes/next/languages/ja.yml[m
[1m+++ b/themes/next/languages/ja.yml[m
[36m@@ -1,10 +1,9 @@[m
[32m+[m[32m---[m
 title:[m
   archive: アーカイブ[m
   category: カテゴリ[m
   tag: タグ[m
[31m-[m
[31m-author: Author[m
[31m-[m
[32m+[m[32m  schedule: スケジュール[m
 menu:[m
   home: ホーム[m
   archives: アーカイブ[m
[36m@@ -12,77 +11,88 @@[m [mmenu:[m
   tags: タグ[m
   about: About[m
   search: 検索[m
[31m-[m
[32m+[m[32m  schedule: スケジュール[m
[32m+[m[32m  sitemap: サイトマップ[m
[32m+[m[32m  commonweal: Commonweal 404[m
 sidebar:[m
   overview: 概要[m
   toc: 見出し[m
[31m-[m
 post:[m
[31m-  sticky: 固定[m
   posted: 投稿日[m
[32m+[m[32m  edited: Edited on[m
[32m+[m[32m  created: 作成された時間[m
   modified: Updated at[m
[32m+[m[32m  edit: Edit this post[m
   in: In[m
[32m+[m[32m  more: more[m
   read_more: 続きを読む[m
   untitled: 無題[m
[32m+[m[32m  sticky: 固定[m
   toc_empty: 見出しがありません[m
[31m-  visitors: Visitors[m
[31m-  wordcount: Words count in article[m
[31m-  min2read: Reading time[m
[31m-  totalcount: Site words total count[m
[32m+[m[32m  views: Views[m
[32m+[m[32m  comments_count: コメント[m
[32m+[m[32m  related_posts: Related Posts[m
[32m+[m[32m  copy_button: Copy[m
[32m+[m[32m  copy_success: Copied[m
[32m+[m[32m  copy_failure: Copy failed[m
   copyright:[m
[31m-    author: Post author[m
[32m+[m[32m    author: 著者[m
     link: Post link[m
[31m-    license_title: Copyright Notice[m
[31m-    license_content: 'All articles in this blog are licensed under[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> unless stating additionally.'[m
[31m-[m
[32m+[m[32m    license_title: 著作権表示[m
[32m+[m[32m    license_content: "All articles in this blog are licensed under %s unless stating additionally."[m
 page:[m
   totally: 全ページ[m
   tags: タグ[m
[31m-[m
 footer:[m
   powered: "Powered by %s"[m
[31m-  theme: Theme[m
[31m-[m
[32m+[m[32m  theme: テーマ[m
[32m+[m[32m  total_views: Total Views[m
[32m+[m[32m  total_visitors: Total Visitors[m
 counter:[m
   tag_cloud:[m
     zero: タグなし[m
[31m-    one: "全 1 タグ"[m
[32m+[m[32m    one: 全 1 タグ[m
     other: "全 %d タグ"[m
[31m-[m
   categories:[m
     zero: カテゴリなし[m
[31m-    one: "全 1 カテゴリ"[m
[32m+[m[32m    one: 全 1 カテゴリ[m
     other: "全 %d カテゴリ"[m
[31m-[m
   archive_posts:[m
     zero: ポストなし[m
[31m-    one: "全 1 ポスト"[m
[32m+[m[32m    one: 全 1 ポスト[m
     other: "全 %d ポスト"[m
[31m-[m
 state:[m
   posts: ポスト[m
   pages: ページ[m
   tags: タグ[m
   categories: カテゴリ[m
[31m-[m
[32m+[m[32msearch:[m
[32m+[m[32m  placeholder: 検索…[m
 cheers:[m
   um: うーん[m
[31m-  ok: OK[m
[32m+[m[32m  ok: はい[m
   nice: まあまあ[m
   good: いいね[m
   great: すごい[m
   excellent: 最高[m
[31m-[m
 keep_on: もっと書こう！[m
[31m-[m
 symbol:[m
[31m-  comma: ', '[m
[31m-  period: '. '[m
[31m-  colon: ':'[m
[31m-[m
[32m+[m[32m  comma: "、"[m
[32m+[m[32m  period: "。"[m
[32m+[m[32m  colon: "："[m
 reward:[m
   donate: Donate[m
[31m-  wechatpay: WeChat Pay[m
[32m+[m[32m  wechatpay: WeChat 支払う[m
   alipay: Alipay[m
   bitcoin: Bitcoin[m
[32m+[m[32mgitmentbutton: Gitment からのコメントを表示[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Toggle navigation bar[m
[32m+[m[32m  prev_page: Previous page[m
[32m+[m[32m  next_page: Next page[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Symbols count in article[m
[32m+[m[32m  count_total: Symbols count total[m
[32m+[m[32m  time: Reading time[m
[32m+[m[32m  time_total: Reading time total[m
[32m+[m[32m  time_minutes: mins.[m
[1mdiff --git a/themes/next/languages/ko.yml b/themes/next/languages/ko.yml[m
[1mindex df4e736..7c2fcd8 100644[m
[1m--- a/themes/next/languages/ko.yml[m
[1m+++ b/themes/next/languages/ko.yml[m
[36m@@ -1,10 +1,9 @@[m
[32m+[m[32m---[m
 title:[m
   archive: 아카이브[m
   category: 카테고리[m
   tag: 태그[m
[31m-[m
[31m-author: 작성자[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
 menu:[m
   home: 홈[m
   archives: 아카이브[m
[36m@@ -12,60 +11,63 @@[m [mmenu:[m
   tags: 태그[m
   about: About[m
   search: 검색[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
[32m+[m[32m  sitemap: Sitemap[m
[32m+[m[32m  commonweal: Commonweal 404[m
 sidebar:[m
   overview: 흝어보기[m
   toc: 목차[m
[31m-[m
 post:[m
[31m-  sticky: 고정[m
   posted: 작성일[m
[32m+[m[32m  edited: Edited on[m
[32m+[m[32m  created: Post created[m
   modified: Updated at[m
[32m+[m[32m  edit: Edit this post[m
   in: In[m
[32m+[m[32m  more: more[m
   read_more: 더 읽어보기[m
   untitled: 제목 없음[m
[32m+[m[32m  sticky: 고정[m
   toc_empty: 목차 없음[m
[31m-  visitors: 방문객[m
[31m-  wordcount: Words count in article[m
[31m-  min2read: Reading time[m
[31m-  totalcount: Site words total count[m
[32m+[m[32m  views: Views[m
[32m+[m[32m  comments_count: 댓글[m
[32m+[m[32m  related_posts: Related Posts[m
[32m+[m[32m  copy_button: Copy[m
[32m+[m[32m  copy_success: Copied[m
[32m+[m[32m  copy_failure: Copy failed[m
   copyright:[m
     author: Post author[m
     link: Post link[m
     license_title: Copyright Notice[m
[31m-    license_content: 'All articles in this blog are licensed under[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> unless stating additionally.'[m
[31m-[m
[32m+[m[32m    license_content: "All articles in this blog are licensed under %s unless stating additionally."[m
 page:[m
   totally: 모두[m
   tags: 태그[m
[31m-[m
 footer:[m
   powered: "Powered by %s"[m
   theme: Theme[m
[31m-[m
[32m+[m[32m  total_views: Total Views[m
[32m+[m[32m  total_visitors: Total Visitors[m
 counter:[m
   tag_cloud:[m
     zero: 태그 없음[m
     one: 1개의 태그[m
     other: "총 %d개의 태그"[m
[31m-[m
   categories:[m
     zero: 카테고리 없음[m
     one: 1개의 카테고리[m
     other: "총 %d개의 카테고리"[m
[31m-[m
   archive_posts:[m
     zero: 포스트 없음[m
     one: 1개의 포스트[m
     other: "총 %d개의 포스트"[m
[31m-[m
 state:[m
   posts: 포스트[m
   pages: 페이지[m
   tags: 태그[m
   categories: 카테고리[m
[31m-[m
[32m+[m[32msearch:[m
[32m+[m[32m  placeholder: Searching...[m
 cheers:[m
   um: 음..[m
   ok: OK[m
[36m@@ -73,16 +75,24 @@[m [mcheers:[m
   good: 좋아요[m
   great: 훌륭해요[m
   excellent: 완벽해요[m
[31m-[m
 keep_on: 포스트를 마저 작성하세요[m
[31m-[m
 symbol:[m
[31m-  comma: ', '[m
[31m-  period: '. '[m
[31m-  colon: ':'[m
[31m-[m
[32m+[m[32m  comma: ", "[m
[32m+[m[32m  period: ". "[m
[32m+[m[32m  colon: ": "[m
 reward:[m
   donate: Donate[m
   wechatpay: WeChat Pay[m
   alipay: Alipay[m
   bitcoin: Bitcoin[m
[32m+[m[32mgitmentbutton: Show comments from Gitment[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Toggle navigation bar[m
[32m+[m[32m  prev_page: Previous page[m
[32m+[m[32m  next_page: Next page[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Symbols count in article[m
[32m+[m[32m  count_total: Symbols count total[m
[32m+[m[32m  time: Reading time[m
[32m+[m[32m  time_total: Reading time total[m
[32m+[m[32m  time_minutes: mins.[m
[1mdiff --git a/themes/next/languages/pt-BR.yml b/themes/next/languages/pt-BR.yml[m
[1mindex 64f2da0..69457f0 100644[m
[1m--- a/themes/next/languages/pt-BR.yml[m
[1m+++ b/themes/next/languages/pt-BR.yml[m
[36m@@ -1,10 +1,9 @@[m
[32m+[m[32m---[m
 title:[m
   archive: Arquivo[m
   category: Categoria[m
   tag: Tag[m
[31m-[m
[31m-author: Autor[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
 menu:[m
   home: Home[m
   archives: Arquivos[m
[36m@@ -12,60 +11,63 @@[m [mmenu:[m
   tags: Tags[m
   about: Sobre[m
   search: Pesquisar[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
[32m+[m[32m  sitemap: Sitemap[m
[32m+[m[32m  commonweal: Commonweal 404[m
 sidebar:[m
   overview: Visão geral[m
   toc: Tabela de conteúdo[m
[31m-[m
 post:[m
[31m-  sticky: Sticky[m
   posted: Postado em[m
[32m+[m[32m  edited: Edited on[m
[32m+[m[32m  created: Post created[m
   modified: Updated at[m
[32m+[m[32m  edit: Edit this post[m
   in: Em[m
[32m+[m[32m  more: more[m
   read_more: Leia mais[m
   untitled: Sem título[m
[32m+[m[32m  sticky: Sticky[m
   toc_empty: Este post não possui tabela de conteúdo[m
[31m-  visitors: Visitantes[m
[31m-  wordcount: Words count in article[m
[31m-  min2read: Reading time[m
[31m-  totalcount: Site words total count[m
[32m+[m[32m  views: Views[m
[32m+[m[32m  comments_count: Comments[m
[32m+[m[32m  related_posts: Related Posts[m
[32m+[m[32m  copy_button: Copy[m
[32m+[m[32m  copy_success: Copied[m
[32m+[m[32m  copy_failure: Copy failed[m
   copyright:[m
     author: Post author[m
     link: Post link[m
     license_title: Copyright Notice[m
[31m-    license_content: 'All articles in this blog are licensed under[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> unless stating additionally.'[m
[31m-[m
[32m+[m[32m    license_content: "All articles in this blog are licensed under %s unless stating additionally."[m
 page:[m
   totally: Totalmente[m
   tags: tags[m
[31m-[m
 footer:[m
   powered: "Feito com %s"[m
   theme: Tema[m
[31m-[m
[32m+[m[32m  total_views: Total Views[m
[32m+[m[32m  total_visitors: Total Visitors[m
 counter:[m
   tag_cloud:[m
     zero: Sem tags[m
     one: 1 tag no total de[m
     other: "%d tags no total de"[m
[31m-[m
   categories:[m
     zero: Sem categoria[m
     one: 1 categoria no total de[m
     other: "%d categoria no total de"[m
[31m-[m
   archive_posts:[m
     zero: Sem posts.[m
     one: 1 post.[m
     other: "%d posts no total."[m
[31m-[m
 state:[m
   posts: Posts[m
   pages: Páginas[m
   tags: Tags[m
   categories: Categorias[m
[31m-[m
[32m+[m[32msearch:[m
[32m+[m[32m  placeholder: Searching...[m
 cheers:[m
   um: Uhmmmm...[m
   ok: OK[m
[36m@@ -73,16 +75,24 @@[m [mcheers:[m
   good: Muito Bom[m
   great: Ótimo[m
   excellent: Excelente[m
[31m-[m
 keep_on: Continuar no post.[m
[31m-[m
 symbol:[m
[31m-  comma: '. '[m
[31m-  period: ', '[m
[31m-  colon: ':'[m
[31m-[m
[32m+[m[32m  comma: ", "[m
[32m+[m[32m  period: ". "[m
[32m+[m[32m  colon: ": "[m
 reward:[m
   donate: Donate[m
   wechatpay: WeChat Pay[m
   alipay: Alipay[m
   bitcoin: Bitcoin[m
[32m+[m[32mgitmentbutton: Show comments from Gitment[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Toggle navigation bar[m
[32m+[m[32m  prev_page: Previous page[m
[32m+[m[32m  next_page: Next page[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Symbols count in article[m
[32m+[m[32m  count_total: Symbols count total[m
[32m+[m[32m  time: Reading time[m
[32m+[m[32m  time_total: Reading time total[m
[32m+[m[32m  time_minutes: mins.[m
[1mdiff --git a/themes/next/languages/pt.yml b/themes/next/languages/pt.yml[m
[1mindex 9c83699..2a98043 100644[m
[1m--- a/themes/next/languages/pt.yml[m
[1m+++ b/themes/next/languages/pt.yml[m
[36m@@ -1,10 +1,9 @@[m
[32m+[m[32m---[m
 title:[m
   archive: Arquivo[m
   category: Categoria[m
   tag: Tag[m
[31m-[m
[31m-author: Author[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
 menu:[m
   home: Home[m
   archives: Arquivos[m
[36m@@ -12,60 +11,63 @@[m [mmenu:[m
   tags: Tags[m
   about: Sobre[m
   search: Pesquisa[m
[31m-[m
[32m+[m[32m  schedule: Schedule[m
[32m+[m[32m  sitemap: Sitemap[m
[32m+[m[32m  commonweal: Commonweal 404[m
 sidebar:[m
   overview: Visão Geral[m
   toc: Tabela de Conteúdo[m
[31m-[m
 post:[m
[31m-  sticky: Sticky[m
   posted: Postado em[m
[32m+[m[32m  edited: Edited on[m
[32m+[m[32m  created: Post created[m
   modified: Updated at[m
[32m+[m[32m  edit: Edit this post[m
   in: Em[m
[32m+[m[32m  more: more[m
   read_more: Ler mais[m
   untitled: Sem título[m
[32m+[m[32m  sticky: Sticky[m
   toc_empty: Esta publicação não possui uma tabela de conteúdo[m
[31m-  visitors: Visitors[m
[31m-  wordcount: Words count in article[m
[31m-  min2read: Reading time[m
[31m-  totalcount: Site words total count[m
[32m+[m[32m  views: Views[m
[32m+[m[32m  comments_count: Comments[m
[32m+[m[32m  related_posts: Related Posts[m
[32m+[m[32m  copy_button: Copy[m
[32m+[m[32m  copy_success: Copied[m
[32m+[m[32m  copy_failure: Copy failed[m
   copyright:[m
     author: Post author[m
     link: Post link[m
     license_title: Copyright Notice[m
[31m-    license_content: 'All articles in this blog are licensed under[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> unless stating additionally.'[m
[31m-[m
[32m+[m[32m    license_content: "All articles in this blog are licensed under %s unless stating additionally."[m
 page:[m
   totally: Totalmente[m
   tags: tags[m
[31m-[m
 footer:[m
   powered: "Desenvolvido com amor com %s"[m
   theme: Tema[m
[31m-[m
[32m+[m[32m  total_views: Total Views[m
[32m+[m[32m  total_visitors: Total Visitors[m
 counter:[m
   tag_cloud:[m
     zero: Sem tags[m
     one: 1 tag no total[m
     other: "%d tags no total"[m
[31m-[m
   categories:[m
     zero: Sem categorias[m
     one: 1 categoria no total[m
     other: "%d categorias no total"[m
[31m-[m
   archive_posts:[m
     zero: Sem publicações.[m
     one: 1 post.[m
     other: "%d publicações no total."[m
[31m-[m
 state:[m
   posts: publicações[m
   pages: páginas[m
   tags: tags[m
   categories: categorias[m
[31m-[m
[32m+[m[32msearch:[m
[32m+[m[32m  placeholder: Searching...[m
 cheers:[m
   um: Um..[m
   ok: OK[m
[36m@@ -73,16 +75,24 @@[m [mcheers:[m
   good: Bom[m
   great: Grandioso[m
   excellent: Excelente[m
[31m-[m
 keep_on: Mantenha-se publicando![m
[31m-[m
 symbol:[m
[31m-  comma: ', '[m
[31m-  period: '. '[m
[31m-  colon: ':'[m
[31m-[m
[32m+[m[32m  comma: ", "[m
[32m+[m[32m  period: ". "[m
[32m+[m[32m  colon: ": "[m
 reward:[m
   donate: Donate[m
   wechatpay: WeChat Pay[m
   alipay: Alipay[m
   bitcoin: Bitcoin[m
[32m+[m[32mgitmentbutton: Show comments from Gitment[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Toggle navigation bar[m
[32m+[m[32m  prev_page: Previous page[m
[32m+[m[32m  next_page: Next page[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Symbols count in article[m
[32m+[m[32m  count_total: Symbols count total[m
[32m+[m[32m  time: Reading time[m
[32m+[m[32m  time_total: Reading time total[m
[32m+[m[32m  time_minutes: mins.[m
[1mdiff --git a/themes/next/languages/ru.yml b/themes/next/languages/ru.yml[m
[1mindex 55b6df1..c7d8c79 100644[m
[1m--- a/themes/next/languages/ru.yml[m
[1m+++ b/themes/next/languages/ru.yml[m
[36m@@ -1,11 +1,9 @@[m
[32m+[m[32m---[m
 title:[m
   archive: Архив[m
   category: Категория[m
   tag: Тэг[m
   schedule: Календарь[m
[31m-[m
[31m-author: Автор[m
[31m-[m
 menu:[m
   home: Главная[m
   archives: Архив[m
[36m@@ -15,74 +13,61 @@[m [mmenu:[m
   search: Поиск[m
   schedule: Календарь[m
   sitemap: Карта сайта[m
[31m-[m
[32m+[m[32m  commonweal: Страница 404[m
 sidebar:[m
   overview: Обзор[m
   toc: Содержание[m
[31m-[m
 post:[m
[31m-  created: Дата создания записи[m
[31m-  modified: Дата обновления записи[m
[31m-  sticky: Ссылка[m
   posted: Размещено[m
[32m+[m[32m  edited: Изменено[m
[32m+[m[32m  created: Создано[m
[32m+[m[32m  modified: Изменено[m
[32m+[m[32m  edit: Редактировать запись[m
   in: в категории[m
[31m-  more: далее[m
[32m+[m[32m  more: more[m
   read_more: Читать полностью[m
   untitled: Без имени[m
[32m+[m[32m  sticky: Ссылка[m
   toc_empty: Эта запись без оглавления[m
[31m-  visitors: Просмотров[m
[31m-  wordcount: Кол-во слов в статье[m
[31m-  min2read: Время чтения в минутах[m
[31m-  totalcount: Общее кол-во слов в записях[m
[32m+[m[32m  views: Просмотров[m
[32m+[m[32m  comments_count: Комментариев[m
[32m+[m[32m  related_posts: Похожие записи[m
[32m+[m[32m  copy_button: Скопировать[m
[32m+[m[32m  copy_success: Скопировано![m
[32m+[m[32m  copy_failure: Ошибка копирования![m
   copyright:[m
     author: Автор записи[m
     link: Ссылка на запись[m
     license_title: Информация об авторских правах[m
[31m-    license_content: 'Все записи на этом сайте защищены лицензией[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> если не указано дополнительно.'[m
[31m-[m
[32m+[m[32m    license_content: "Все записи на этом сайте защищены лицензией %s, если не указано дополнительно."[m
 page:[m
   totally: Всего[m
   tags: тэги[m
[31m-[m
 footer:[m
[31m-  powered: "Powered by %s"[m
[31m-  theme: Theme[m
[31m-[m
[32m+[m[32m  powered: "Генератор — %s"[m
[32m+[m[32m  theme: Тема[m
[32m+[m[32m  total_views: Всего просмотров[m
[32m+[m[32m  total_visitors: Всего посетителей[m
 counter:[m
   tag_cloud:[m
     zero: Нет тэгов.[m
     one: 1 тэг.[m
[31m-    two: "%d тэга всего."[m
[31m-    three: "%d тэга всего."[m
[31m-    four: "%d тэга всего."[m
     other: "%d тэгов всего."[m
[31m-[m
   categories:[m
     zero: Нет категорий.[m
     one: 1 категория.[m
[31m-    two: "%d категории всего."[m
[31m-    three: "%d категории всего."[m
[31m-    four: "%d категории всего."[m
     other: "%d категорий всего."[m
[31m-[m
   archive_posts:[m
     zero: Нет записей.[m
     one: 1 запись.[m
[31m-    two: "%d записи всего."[m
[31m-    three: "%d записи всего."[m
[31m-    four: "%d записи всего."[m
     other: "%d записей всего."[m
[31m-[m
 state:[m
   posts: Архив[m
   pages: Страницы[m
   tags: Тэги[m
   categories: Категории[m
[31m-[m
 search:[m
   placeholder: Поиск...[m
[31m-[m
 cheers:[m
   um: Эм..[m
   ok: OK[m
[36m@@ -90,16 +75,24 @@[m [mcheers:[m
   good: Хорошо[m
   great: Замечательно[m
   excellent: Великолепно[m
[31m-[m
 keep_on: Продолжаю писать.[m
[31m-[m
 symbol:[m
[31m-  comma: ', '[m
[31m-  period: '. '[m
[31m-  colon: ':'[m
[31m-[m
[32m+[m[32m  comma: ", "[m
[32m+[m[32m  period: ". "[m
[32m+[m[32m  colon: ": "[m
 reward:[m
   donate: Донат[m
   wechatpay: WeChat Pay[m
   alipay: Alipay[m
   bitcoin: Bitcoin[m
[32m+[m[32mgitmentbutton: Открыть Gitment комментарии[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Показать/скрыть меню[m
[32m+[m[32m  prev_page: Предыдущая страница[m
[32m+[m[32m  next_page: Следующая страница[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Кол-во символов в статье[m
[32m+[m[32m  count_total: Общее кол-во символов[m
[32m+[m[32m  time: Время чтения[m
[32m+[m[32m  time_total: Общее время чтения[m
[32m+[m[32m  time_minutes: мин.[m
[1mdiff --git a/themes/next/languages/vi.yml b/themes/next/languages/vi.yml[m
[1mindex 1d46c26..9bb900b 100644[m
[1m--- a/themes/next/languages/vi.yml[m
[1m+++ b/themes/next/languages/vi.yml[m
[36m@@ -1,11 +1,9 @@[m
[32m+[m[32m---[m
 title:[m
   archive: Lưu Trữ[m
   category: Phân Loại[m
   tag: Thẻ[m
   schedule: Danh Mục[m
[31m-[m
[31m-author: Tác giả[m
[31m-[m
 menu:[m
   home: Trang Chủ[m
   archives: Lưu Trữ[m
[36m@@ -16,65 +14,60 @@[m [mmenu:[m
   schedule: Danh Mục[m
   sitemap: Bản đồ trang[m
   commonweal: Commonweal 404[m
[31m-[m
 sidebar:[m
   overview: Tổng Quan[m
   toc: Mục Lục[m
[31m-[m
 post:[m
[32m+[m[32m  posted: Tạo lúc[m
[32m+[m[32m  edited: Edited on[m
   created: Được tạo[m
   modified: Được thay đổi[m
[31m-  sticky: Đính[m
[31m-  posted: Tạo lúc[m
[32m+[m[32m  edit: Edit this post[m
   in: Trong[m
   more: thêm[m
   read_more: Đọc tiếp[m
   untitled: Không có tiêu đề[m
[32m+[m[32m  sticky: Đính[m
   toc_empty: Bài viết này không có mục lục[m
[31m-  visitors: Người xem[m
[31m-  wordcount: Số từ trong bài viết[m
[31m-  min2read: Thời gian đọc[m
[31m-  totalcount: Số từ trong trang[m
[32m+[m[32m  views: Views[m
[32m+[m[32m  comments_count: Comments[m
[32m+[m[32m  related_posts: Related Posts[m
[32m+[m[32m  copy_button: Copy[m
[32m+[m[32m  copy_success: Copied[m
[32m+[m[32m  copy_failure: Copy failed[m
   copyright:[m
     author: Người viết[m
     link: Liên kết bài viết[m
     license_title: Chú ý bản quyền[m
[31m-    license_content: 'Tất cả bài viết trong blog này được đăng ký bởi[m
[31m-      <a href="%s" rel="external nofollow" target="_blank">%s</a> trừ khi có thông báo bổ sung.'[m
[31m-[m
[32m+[m[32m    license_content: "Tất cả bài viết trong blog này được đăng ký bởi %s trừ khi có thông báo bổ sung."[m
 page:[m
   totally: Toàn bộ[m
   tags: thẻ[m
[31m-[m
 footer:[m
   powered: "Cung cấp bởi %s"[m
   theme: Giao Diện[m
[31m-[m
[32m+[m[32m  total_views: Total Views[m
[32m+[m[32m  total_visitors: Total Visitors[m
 counter:[m
   tag_cloud:[m
     zero: Không có thẻ nào[m
     one: có 1 thẻ tất cả[m
     other: "có %d thẻ tất cả"[m
[31m-[m
   categories:[m
     zero: Không có trong mục nào[m
     one: có 1 mục tất cả[m
     other: "có %d mục tất cả"[m
[31m-[m
   archive_posts:[m
     zero: Không có bài viết.[m
     one: 1 bài viết.[m
     other: "tổng số %d bài viết."[m
[31m-[m
 state:[m
   posts: bài viết[m
   pages: trang[m
   tags: thẻ[m
   categories: mục[m
[31m-[m
 search:[m
   placeholder: Đang tìm...[m
[31m-[m
 cheers:[m
   um: Um..[m
   ok: Đồng Ý[m
[36m@@ -82,18 +75,24 @@[m [mcheers:[m
   good: Tốt[m
   great: Tuyệt vời[m
   excellent: Tuyệt cú mèo[m
[31m-[m
 keep_on: Giữ tiến độ nha.[m
[31m-[m
 symbol:[m
[31m-  comma: ', '[m
[31m-  period: '. '[m
[31m-  colon: ':'[m
[31m-[m
[32m+[m[32m  comma: ", "[m
[32m+[m[32m  period: ". "[m
[32m+[m[32m  colon: ": "[m
 reward:[m
   donate: Tài trợ[m
   wechatpay: WeChat Pay[m
   alipay: Alipay[m
   bitcoin: Bitcoin[m
[31m-[m
 gitmentbutton: Hiển thị bình luận từ Gitment[m
[32m+[m[32maccessibility:[m
[32m+[m[32m  nav_toggle: Toggle navigation bar[m
[32m+[m[32m  prev_page: Previous page[m
[32m+[m[32m  next_page: Next page[m
[32m+[m[32msymbols_count_time:[m
[32m+[m[32m  count: Symbols count in article[m
[32m+[m[32m  count_total: Symbols count total[m
[32m+[m[32m  time: Reading time[m
[32m+[m[32m  time_total: Reading time total[m
[32m+[m[32m  time_minutes: mins.[m
[1mdiff --git a/themes/next/layout/_layout.swig b/themes/next/layout/_layout.swig[m
[1mindex acd449b..1472a8b 100644[m
[1m--- a/themes/next/layout/_layout.swig[m
[1m+++ b/themes/next/layout/_layout.swig[m
[36m@@ -1,5 +1,14 @@[m
 <!DOCTYPE html>[m
 [m
[32m+[m[32m{# NexT version #}[m
[32m+[m[32m{% set version = next_env('version') %}[m
[32m+[m
[32m+[m[32m{# Language & Config #}[m
[32m+[m[32m{% set title = __('title') !== 'title' && __('title') || config.title %}[m
[32m+[m[32m{% set subtitle = __('subtitle') !== 'subtitle' && __('subtitle') || config.subtitle %}[m
[32m+[m[32m{% set author = __('author') !== 'author' && __('author') || config.author %}[m
[32m+[m[32m{% set description = __('description') !== 'description' && __('description') || config.description %}[m
[32m+[m
 {% set html_class = 'theme-next ' + theme.scheme %}[m
 {% if theme.motion.enable %}[m
   {% set html_class = html_class + ' use-motion' %}[m
[36m@@ -7,9 +16,11 @@[m
 [m
 <html class="{{ html_class | lower }}" lang="{{ config.language }}">[m
 <head>[m
[31m-  {% include '_partials/head.swig' %}[m
[32m+[m[32m  {{ partial('_partials/head/head.swig', {}, {cache: theme.cache.enable}) }}[m
[32m+[m[32m  {% include '_partials/head/head-unique.swig' %}[m
   <title>{% block title %}{% endblock %}</title>[m
   {% include '_third-party/analytics/index.swig' %}[m
[32m+[m[32m  {{ partial('_scripts/noscript.swig', {}, {cache: theme.cache.enable}) }}[m
 </head>[m
 [m
 <body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">[m
[36m@@ -26,16 +37,20 @@[m
     </a>[m
 [m
     <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">[m
[31m-      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>[m
[32m+[m[32m      <div class="header-inner">{% include '_partials/header/index.swig' %}</div>[m
     </header>[m
 [m
[32m+[m[32m    {{ partial('_third-party/github-banner.swig', {}, {cache: theme.cache.enable}) }}[m
[32m+[m
     <main id="main" class="main">[m
       <div class="main-inner">[m
         <div class="content-wrap">[m
[32m+[m[32m          {% if theme.scheme === 'Pisces' || theme.scheme === 'Gemini' %}[m
[32m+[m[32m            {% include '_partials/header/sub-menu.swig' %}[m
[32m+[m[32m          {% endif %}[m
           <div id="content" class="content">[m
             {% block content %}{% endblock %}[m
           </div>[m
[31m-          {% include '_third-party/duoshuo-hot-articles.swig' %}[m
           {% include '_partials/comments.swig' %}[m
         </div>[m
         {% if theme.sidebar.display !== 'remove' %}[m
[36m@@ -46,7 +61,7 @@[m
 [m
     <footer id="footer" class="footer">[m
       <div class="footer-inner">[m
[31m-        {% include '_partials/footer.swig' %}[m
[32m+[m[32m        {{ partial('_partials/footer.swig', {}, {cache: theme.cache.enable}) }}[m
         {% include '_third-party/analytics/analytics-with-widget.swig' %}[m
         {% block footer %}{% endblock %}[m
       </div>[m
[36m@@ -86,11 +101,14 @@[m
   {% include '_third-party/analytics/lean-analytics.swig' %}[m
   {% include '_third-party/analytics/firestore.swig' %}[m
   {% include '_third-party/seo/baidu-push.swig' %}[m
[32m+[m[32m  {% include '_third-party/math/index.swig' %}[m
   {% include '_third-party/needsharebutton.swig' %}[m
   {% include '_third-party/rating.swig' %}[m
[31m-  {% include '_third-party/mathjax.swig' %}[m
[32m+[m[32m  {% include '_third-party/pangu.swig' %}[m
   {% include '_third-party/scroll-cookie.swig' %}[m
   {% include '_third-party/exturl.swig' %}[m
[32m+[m[32m  {% include '_third-party/bookmark.swig' %}[m
[32m+[m[32m  {% include '_third-party/copy-code.swig' %}[m
   <!-- 页面点击小心心 -->[m
   <script type="text/javascript" src="/js/src/love.js"></script>[m
 </body>[m
[1mdiff --git a/themes/next/layout/_macro/post-copyright.swig b/themes/next/layout/_macro/post-copyright.swig[m
[1mindex 4ad0490..fd3d9c0 100644[m
[1m--- a/themes/next/layout/_macro/post-copyright.swig[m
[1m+++ b/themes/next/layout/_macro/post-copyright.swig[m
[36m@@ -1,14 +1,14 @@[m
 <ul class="post-copyright">[m
   <li class="post-copyright-author">[m
[31m-    <strong>{{ __('post.copyright.author') + __('symbol.colon') }}</strong>[m
[31m-    {{ post.author | default(config.author) }}[m
[31m-  </li>[m
[32m+[m[32m    <strong>{{ __('post.copyright.author') + __('symbol.colon') }} </strong>{#[m
[32m+[m[32m  #}{{ post.author | default(author) }}{#[m
[32m+[m[32m#}</li>[m
   <li class="post-copyright-link">[m
     <strong>{{ __('post.copyright.link') + __('symbol.colon') }}</strong>[m
     <a href="{{ post.url | default(post.permalink) }}" title="{{ post.title }}">{{ post.url | default(post.permalink) }}</a>[m
   </li>[m
   <li class="post-copyright-license">[m
[31m-    <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>[m
[31m-    {{ __('post.copyright.license_content', theme.post_copyright.license_url, theme.post_copyright.license) }}[m
[31m-  </li>[m
[32m+[m[32m    <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>{#[m
[32m+[m[32m  #}{{ post.copyright | default(__('post.copyright.license_content', theme.post_copyright.license)) }}{#[m
[32m+[m[32m#}</li>[m
 </ul>[m
[1mdiff --git a/themes/next/layout/_macro/post.swig b/themes/next/layout/_macro/post.swig[m
[1mindex 431542b..880a76c 100644[m
[1m--- a/themes/next/layout/_macro/post.swig[m
[1m+++ b/themes/next/layout/_macro/post.swig[m
[36m@@ -10,6 +10,10 @@[m
     {% set post_class = post_class + ' ' + 'post-sticky' %}[m
   {% endif %}[m
 [m
[32m+[m[32m  {% if theme.reading_progress.enable && not is_index %}[m
[32m+[m[32m    <div class="reading-progress-bar"></div>[m
[32m+[m[32m  {% endif %}[m
[32m+[m
   <article class="{{ post_class }}" itemscope itemtype="http://schema.org/Article">[m
   {##################}[m
   {### POST BLOCK ###}[m
[36m@@ -18,13 +22,13 @@[m
     <link itemprop="mainEntityOfPage" href="{{ config.url }}{{ url_for(post.path) }}">[m
 [m
     <span hidden itemprop="author" itemscope itemtype="http://schema.org/Person">[m
[31m-      <meta itemprop="name" content="{{ theme.author }}">[m
[31m-      <meta itemprop="description" content="{{ theme.signature }}">[m
[31m-      <meta itemprop="image" content="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}">[m
[32m+[m[32m      <meta itemprop="name" content="{{ author }}">[m
[32m+[m[32m      <meta itemprop="description" content="{{ description }}">[m
[32m+[m[32m      <meta itemprop="image" content="{{ url_for( theme.avatar.url | default(theme.images + '/avatar.gif') ) }}">[m
     </span>[m
 [m
     <span hidden itemprop="publisher" itemscope itemtype="http://schema.org/Organization">[m
[31m-      <meta itemprop="name" content="{{ config.title }}">[m
[32m+[m[32m      <meta itemprop="name" content="{{ title }}">[m
     </span>[m
 [m
     {% if not headlessPost %}[m
[36m@@ -52,16 +56,28 @@[m
                     <i class="fa fa-thumb-tack"></i>[m
                   </span>[m
                 {% endif %}[m
[31m-                <a class="post-title-link" href="{{ url_for(post.path) }}" itemprop="url">{#[m
[31m-                #}{{ post.title | default(__('post.untitled'))}}{#[m
[31m-              #}</a>{#[m
[31m-            #}{% else %}{{ post.title }}{% endif %}{#[m
[31m-          #}{% endif %}{#[m
[31m-        #}</{% if theme.seo %}h2{% else %}h1{% endif %}>[m
[32m+[m[32m                <a class="post-title-link" href="{{ url_for(post.path) }}" itemprop="url">[m
[32m+[m[32m                  {{ post.title | default(__('post.untitled'))}}[m
[32m+[m[32m                </a>[m
[32m+[m[32m              {% else -%}[m
[32m+[m[32m                {{- post.title -}}[m
[32m+[m[32m                {% if theme.post_edit.enable -%}[m
[32m+[m[32m                  <a href="{{ theme.post_edit.url }}{{ post.source.slice(7) }}" class="post-edit-link" title="{{ __('post.edit') }}" target="_blank">[m
[32m+[m[32m                    <i class="fa fa-pencil"></i>[m
[32m+[m[32m                  </a>[m
[32m+[m[32m                {%- endif %}[m
[32m+[m[32m              {% endif %}[m
[32m+[m[32m            {% endif %}[m
[32m+[m[32m          </{% if theme.seo %}h2{% else %}h1{% endif %}>[m
         {% endif %}[m
 [m
         <div class="post-meta">[m
           <span class="post-time">[m
[32m+[m
[32m+[m[32m            {% set date_diff = date(post.date) != date(post.updated) %}[m
[32m+[m[32m            {% set time_diff = time(post.date) != time(post.updated) %}[m
[32m+[m[32m            {% set datetime_diff = date_diff or time_diff %}[m
[32m+[m
             {% if theme.post_meta.created_at %}[m
               <span class="post-meta-item-icon">[m
                 <i class="fa fa-calendar-o"></i>[m
[36m@@ -69,25 +85,40 @@[m
               {% if theme.post_meta.item_text %}[m
                 <span class="post-meta-item-text">{{ __('post.posted') }}</span>[m
               {% endif %}[m
[31m-              <time title="{{ __('post.created') }}" itemprop="dateCreated datePublished" datetime="{{ moment(post.date).format() }}">[m
[31m-                {{ date(post.date, config.date_format) }}[m
[32m+[m
[32m+[m[32m              {% if !date_diff && time_diff && theme.post_meta.updated_at.enabled && theme.post_meta.updated_at.another_day %}[m
[32m+[m[32m                {% set create_title = __('post.created') + __('symbol.colon') + full_date(post.date) + ' / ' + __('post.modified') + __('symbol.colon') + time(post.updated) %}[m
[32m+[m[32m              {% else %}[m
[32m+[m[32m                {% set create_title = __('post.created') + __('symbol.colon') + full_date(post.date) %}[m
[32m+[m[32m              {% endif %}[m
[32m+[m
[32m+[m[32m              <time title="{{ create_title }}" itemprop="dateCreated datePublished" datetime="{{ moment(post.date).format() }}">{#[m
[32m+[m[32m              #}{{ date(post.date) -}}[m
               </time>[m
             {% endif %}[m
 [m
[31m-            {% if theme.post_meta.created_at and theme.post_meta.updated_at %}[m
[31m-              <span class="post-meta-divider">|</span>[m
[31m-            {% endif %}[m
[32m+[m[32m            {% if theme.post_meta.updated_at.enabled && datetime_diff %}[m
[32m+[m[32m              {% set display_updated = !theme.post_meta.updated_at.another_day || theme.post_meta.updated_at.another_day && date_diff %}[m
 [m
[31m-            {% if theme.post_meta.updated_at %}[m
[31m-              <span class="post-meta-item-icon">[m
[31m-                <i class="fa fa-calendar-check-o"></i>[m
[31m-              </span>[m
[31m-              {% if theme.post_meta.item_text %}[m
[31m-                <span class="post-meta-item-text">{{ __('post.modified') }}&#58;</span>[m
[32m+[m[32m              {% if display_updated or !theme.post_meta.created_at %}[m
[32m+[m[32m                {% if theme.post_meta.created_at and theme.post_meta.updated_at.enabled %}[m
[32m+[m[32m                <span class="post-meta-divider">|</span>[m
[32m+[m[32m                {% endif %}[m
[32m+[m
[32m+[m[32m                <span class="post-meta-item-icon">[m
[32m+[m[32m                  <i class="fa fa-calendar-check-o"></i>[m
[32m+[m[32m                </span>[m
[32m+[m[32m                {% if theme.post_meta.item_text %}[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('post.edited') }}</span>[m
[32m+[m[32m                {% endif %}[m
[32m+[m[32m                <time title="{{ __('post.modified') + __('symbol.colon') + full_date(post.updated) }}" itemprop="dateModified" datetime="{{ moment(post.updated).format() }}">{#[m
[32m+[m[32m                #}{% if date_diff -%}[m
[32m+[m[32m                    {{- date(post.updated) -}}[m
[32m+[m[32m                  {%- else -%}[m
[32m+[m[32m                    {{- time(post.updated) -}}[m
[32m+[m[32m                  {%- endif -%}[m
[32m+[m[32m                </time>[m
               {% endif %}[m
[31m-              <time title="{{ __('post.modified') }}" itemprop="dateModified" datetime="{{ moment(post.updated).format() }}">[m
[31m-                {{ date(post.updated, config.date_format) }}[m
[31m-              </time>[m
             {% endif %}[m
           </span>[m
 [m
[36m@@ -103,11 +134,11 @@[m
                 <span class="post-meta-item-text">{{ __('post.in') }}</span>[m
               {% endif %}[m
               {% for cat in post.categories %}[m
[31m-                <span itemprop="about" itemscope itemtype="http://schema.org/Thing">[m
[31m-                  <a href="{{ url_for(cat.path) }}" itemprop="url" rel="index">[m
[31m-                    <span itemprop="name">{{ cat.name }}</span>[m
[31m-                  </a>[m
[31m-                </span>[m
[32m+[m[32m                <span itemprop="about" itemscope itemtype="http://schema.org/Thing">{#[m
[32m+[m[32m                #}<a href="{{ url_for(cat.path) }}" itemprop="url" rel="index">{#[m
[32m+[m[32m                  #}<span itemprop="name">{{ cat.name }}</span>{#[m
[32m+[m[32m                #}</a>{#[m
[32m+[m[32m              #}</span>[m
 [m
                 {% set cat_length = post.categories.length %}[m
                 {% if cat_length > 1 and loop.index !== cat_length %}[m
[36m@@ -118,24 +149,14 @@[m
           {% endif %}[m
 [m
           {% if post.comments %}[m
[31m-            {% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}[m
[32m+[m[32m            {% if theme.facebook_comments_plugin.enable %}[m
               <span class="post-comments-count">[m
                 <span class="post-meta-divider">|</span>[m
                 <span class="post-meta-item-icon">[m
                   <i class="fa fa-comment-o"></i>[m
                 </span>[m
                 <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">[m
[31m-                  <span class="post-comments-count ds-thread-count" data-thread-key="{{ post.path }}" itemprop="commentCount"></span>[m
[31m-                </a>[m
[31m-              </span>[m
[31m-            {% elseif theme.facebook_comments_plugin.enable %}[m
[31m-              <span class="post-comments-count">[m
[31m-                <span class="post-meta-divider">|</span>[m
[31m-                <span class="post-meta-item-icon">[m
[31m-                  <i class="fa fa-comment-o"></i>[m
[31m-                </span>[m
[31m-                <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">[m
[31m-                  <span class="post-comments-count fb-comments-count" data-href="{{ post.permalink }}" itemprop="commentCount">0</span> comments[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span> <span class="post-comments-count fb-comments-count" data-href="{{ post.permalink }}" itemprop="commentCount">0</span>[m
                 </a>[m
               </span>[m
             {% elseif theme.disqus.enable and theme.disqus.count %}[m
[36m@@ -145,6 +166,9 @@[m
                   <i class="fa fa-comment-o"></i>[m
                 </span>[m
                 <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">[m
[32m+[m[32m                {% if __('disqus') !== 'disqus' -%}[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>[m
[32m+[m[32m                {% endif %}[m
                   <span class="post-comments-count disqus-comment-count"[m
                         data-disqus-identifier="{{ post.path }}" itemprop="commentCount"></span>[m
                 </a>[m
[36m@@ -157,7 +181,7 @@[m
                   <i class="fa fa-comment-o"></i>[m
                 </span>[m
                 <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">[m
[31m-                  <span class="post-comments-count hc-comment-count" data-xid="{{ post.path }}" itemprop="commentsCount"></span>[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span> <span class="post-comments-count hc-comment-count" data-xid="{{ post.path }}" itemprop="commentsCount"></span>[m
                 </a>[m
               </span>[m
               <!--/noindex-->[m
[36m@@ -169,11 +193,11 @@[m
               </span>[m
               {% if is_post() %}[m
                 <a href="{{ url_for(post.path) }}#SOHUCS" itemprop="discussionUrl">[m
[31m-                  <span id="changyan_count_unit" class="post-comments-count hc-comment-count" data-xid="{{ post.path }}" itemprop="commentsCount"></span>[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span> <span id="changyan_count_unit" class="post-comments-count hc-comment-count" data-xid="{{ post.path }}" itemprop="commentsCount"></span>[m
                 </a>[m
               {% else %}[m
                 <a href="{{ url_for(post.path) }}#SOHUCS" itemprop="discussionUrl">[m
[31m-                  <span id="url::{{ post.permalink }}" class="cy_cmt_count" data-xid="{{ post.path }}" itemprop="commentsCount" ></span>[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span> <span id="url::{{ post.permalink }}" class="cy_cmt_count" data-xid="{{ post.path }}" itemprop="commentsCount" ></span>[m
                 </a>[m
               {% endif %}[m
             {% elseif is_post() and theme.gitment.enable and theme.gitment.mint and theme.gitment.count %}[m
[36m@@ -183,7 +207,7 @@[m
                   <i class="fa fa-comment-o"></i>[m
                 </span>[m
                 <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">[m
[31m-                  <span class="post-comments-count gitment-comments-count" data-xid="{{ url_for(post.path) }}" itemprop="commentsCount"></span>[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span> <span class="post-comments-count gitment-comments-count" data-xid="{{ url_for(post.path) }}" itemprop="commentsCount"></span>[m
                 </a>[m
               </span>[m
             {% elseif theme.valine.enable and theme.valine.appid and theme.valine.appkey %}[m
[36m@@ -193,7 +217,7 @@[m
                   <i class="fa fa-comment-o"></i>[m
                 </span>[m
                 <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">[m
[31m-                  <span class="post-comments-count valine-comment-count" data-xid="{{ url_for(post.path) }}" itemprop="commentCount"></span>[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span> <span class="post-comments-count valine-comment-count" data-xid="{{ url_for(post.path) }}" itemprop="commentCount"></span>[m
                 </a>[m
               </span>[m
             {% endif %}[m
[36m@@ -204,62 +228,65 @@[m
              <span id="{{ url_for(post.path) }}" class="leancloud_visitors" data-flag-title="{{ post.title }}">[m
                <span class="post-meta-divider">|</span>[m
                <span class="post-meta-item-icon">[m
[31m-                 <i class="fa fa-fire"></i>[m
[32m+[m[32m                 <i class="fa fa-eye"></i>[m
                </span>[m
                {% if theme.post_meta.item_text %}[m
[31m-                 <span class="post-meta-item-text">{{__('post.visitors')}}&#58;</span>[m
[32m+[m[32m                 <span class="post-meta-item-text">{{__('post.views') + __('symbol.colon') }}</span>[m
                {% endif %}[m
                  <span class="leancloud-visitors-count"></span>[m
[31m-                 <span>℃</span>[m
              </span>[m
           {% endif %}[m
 [m
[31m-          {% if not is_index and theme.busuanzi_count.enable and theme.busuanzi_count.page_pv %}[m
[32m+[m[32m          {% if not is_index and theme.busuanzi_count.enable and theme.busuanzi_count.post_views %}[m
             <span class="post-meta-divider">|</span>[m
[31m-            <span class="page-pv">{{ theme.busuanzi_count.page_pv_header }}[m
[31m-            <span class="busuanzi-value" id="busuanzi_value_page_pv" ></span>{{ theme.busuanzi_count.page_pv_footer }}[m
[32m+[m[32m            <span class="post-meta-item-icon"[m
[32m+[m[32m            {% if not theme.post_meta.item_text %} title="{{ __('post.views') }}" {% endif %}>[m
[32m+[m[32m            <i class="fa fa-{{ theme.busuanzi_count.post_views_icon }}"></i>[m
[32m+[m[32m            {% if theme.post_meta.item_text %} {{__('post.views') + __('symbol.colon') }} {% endif %}[m
[32m+[m[32m            <span class="busuanzi-value" id="busuanzi_value_page_pv" ></span>[m
             </span>[m
           {% endif %}[m
 [m
[31m-          {% if theme.post_wordcount.wordcount or theme.post_wordcount.min2read %}[m
[31m-            <div class="post-wordcount">[m
[31m-              {% if theme.post_wordcount.wordcount %}[m
[31m-                {% if not theme.post_wordcount.separated_meta %}[m
[31m-                  <span class="post-meta-divider">|</span>[m
[31m-                {% endif %}[m
[32m+[m[32m          {% if config.symbols_count_time.symbols or config.symbols_count_time.time %}[m
[32m+[m[32m            <div class="post-symbolscount">[m
[32m+[m[32m              {% if not theme.symbols_count_time.separated_meta %}[m
[32m+[m[32m                <span class="post-meta-divider">|</span>[m
[32m+[m[32m              {% endif %}[m
[32m+[m
[32m+[m[32m              {% if config.symbols_count_time.symbols %}[m
                 <span class="post-meta-item-icon">[m
                   <i class="fa fa-file-word-o"></i>[m
                 </span>[m
[31m-                {% if theme.post_wordcount.item_text %}[m
[31m-                  <span class="post-meta-item-text">{{ __('post.wordcount') }}&#58;</span>[m
[32m+[m[32m                {% if theme.symbols_count_time.item_text_post %}[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('symbols_count_time.count') + __('symbol.colon') }}</span>[m
                 {% endif %}[m
[31m-                <span title="{{ __('post.wordcount') }}">[m
[31m-                  {{ wordcount(post.content) }}[m
[31m-                </span>[m
[32m+[m[32m                <span title="{{ __('symbols_count_time.count') }}">{#[m
[32m+[m[32m                #}{{ symbolsCount(post.content) }}{#[m
[32m+[m[32m              #}</span>[m
               {% endif %}[m
 [m
[31m-              {% if theme.post_wordcount.wordcount and theme.post_wordcount.min2read %}[m
[32m+[m[32m              {% if config.symbols_count_time.symbols and config.symbols_count_time.time %}[m
                 <span class="post-meta-divider">|</span>[m
               {% endif %}[m
 [m
[31m-              {% if theme.post_wordcount.min2read %}[m
[32m+[m[32m              {% if config.symbols_count_time.time %}[m
                 <span class="post-meta-item-icon">[m
                   <i class="fa fa-clock-o"></i>[m
                 </span>[m
[31m-                {% if theme.post_wordcount.item_text %}[m
[31m-                  <span class="post-meta-item-text">{{ __('post.min2read') }} &asymp;</span>[m
[32m+[m[32m                {% if theme.symbols_count_time.item_text_post %}[m
[32m+[m[32m                  <span class="post-meta-item-text">{{ __('symbols_count_time.time') }} &asymp;</span>[m
                 {% endif %}[m
[31m-                <span title="{{ __('post.min2read') }}">[m
[31m-                  {{ min2read(post.content) }}[m
[31m-                </span>[m
[32m+[m[32m                <span title="{{ __('symbols_count_time.time') }}">{#[m
[32m+[m[32m                #}{{ symbolsTime(post.content, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}{#[m
[32m+[m[32m              #}</span>[m
               {% endif %}[m
             </div>[m
           {% endif %}[m
 [m
           {% if post.description and (not theme.excerpt_description or not is_index) %}[m
[31m-              <div class="post-description">[m
[31m-                  {{ post.description }}[m
[31m-              </div>[m
[32m+[m[32m              <div class="post-description">{#[m
[32m+[m[32m                #}{{ post.description }}{#[m
[32m+[m[32m            #}</div>[m
           {% endif %}[m
 [m
         </div>[m
[36m@@ -304,7 +331,7 @@[m
           {{ post.excerpt }}[m
           <!--noindex-->[m
           <div class="post-button text-center">[m
[31m-            <a class="btn" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#{{ __('post.more') }}{% endif %}" rel="contents">[m
[32m+[m[32m            <a class="btn" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#more{% endif %}" rel="contents">[m
               {{ __('post.read_more') }} &raquo;[m
             </a>[m
           </div>[m
[36m@@ -315,7 +342,7 @@[m
           {% if content.length > theme.auto_excerpt.length %}...{% endif %}[m
           <!--noindex-->[m
           <div class="post-button text-center">[m
[31m-            <a class="btn" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#{{ __('post.more') }}{% endif %}" rel="contents">[m
[32m+[m[32m            <a class="btn" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#more{% endif %}" rel="contents">[m
               {{ __('post.read_more') }} &raquo;[m
             </a>[m
           </div>[m
[36m@@ -331,28 +358,15 @@[m
         {{ post.content }}[m
       {% endif  %}[m
     </div>[m
[32m+[m
[32m+[m[32m    {% if theme.related_posts.enable and (theme.related_posts.display_in_home or not is_index) %}[m
[32m+[m[32m      {% include 'post-related.swig' with { post: post } %}[m
[32m+[m[32m    {% endif %}[m
[32m+[m
     {#####################}[m
     {### END POST BODY ###}[m
     {#####################}[m
 [m
[31m-    {#################}[m
[31m-    {### POST END ###}[m
[31m-    {#################}[m
[31m-    <div>[m
[31m-      {% if not is_index %}[m
[31m-        {% include 'passage-end-tag.swig' %}[m
[31m-      {% endif %}[m
[31m-    </div>[m
[31m-    {#################}[m
[31m-    {### END POST END ###}[m
[31m-    {#################}[m
[31m-[m
[31m-    <div>[m
[31m-      {% if not is_index %}[m
[31m-        {% include 'my-copyright.swig' %}[m
[31m-      {% endif %}[m
[31m-    </div>[m
[31m-[m
     {% if theme.wechat_subscriber.enabled and not is_index %}[m
       <div>[m
         {% include 'wechat-subscriber.swig' %}[m
[36m@@ -375,7 +389,7 @@[m
       {% if post.tags and post.tags.length and not is_index %}[m
         <div class="post-tags">[m
           {% for tag in post.tags %}[m
[31m-            <a href="{{ url_for(tag.path) }}" rel="tag"><i class="fa fa-tag"></i> {{ tag.name }}</a>[m
[32m+[m[32m            <a href="{{ url_for(tag.path) }}" rel="tag"># {{ tag.name }}</a>[m
           {% endfor %}[m
         </div>[m
       {% endif %}[m
[1mdiff --git a/themes/next/layout/_macro/reward.swig b/themes/next/layout/_macro/reward.swig[m
[1mindex 268436e..04c75e2 100644[m
[1m--- a/themes/next/layout/_macro/reward.swig[m
[1m+++ b/themes/next/layout/_macro/reward.swig[m
[36m@@ -7,21 +7,21 @@[m
 [m
     {% if theme.wechatpay %}[m
       <div id="wechat" style="display: inline-block">[m
[31m-        <img id="wechat_qr" src="{{ theme.wechatpay }}" alt="{{ theme.author }} {{ __('reward.wechatpay') }}"/>[m
[32m+[m[32m        <img id="wechat_qr" src="{{ url_for(theme.wechatpay) }}" alt="{{ author }} {{ __('reward.wechatpay') }}"/>[m
         <p>{{ __('reward.wechatpay') }}</p>[m
       </div>[m
     {% endif %}[m
 [m
     {% if theme.alipay %}[m
       <div id="alipay" style="display: inline-block">[m
[31m-        <img id="alipay_qr" src="{{ theme.alipay }}" alt="{{ theme.author }} {{ __('reward.alipay') }}"/>[m
[32m+[m[32m        <img id="alipay_qr" src="{{ url_for(theme.alipay) }}" alt="{{ author }} {{ __('reward.alipay') }}"/>[m
         <p>{{ __('reward.alipay') }}</p>[m
       </div>[m
     {% endif %}[m
 [m
     {% if theme.bitcoin %}[m
       <div id="bitcoin" style="display: inline-block">[m
[31m-        <img id="bitcoin_qr" src="{{ theme.bitcoin }}" alt="{{ theme.author }} {{ __('reward.bitcoin') }}"/>[m
[32m+[m[32m        <img id="bitcoin_qr" src="{{ url_for(theme.bitcoin) }}" alt="{{ author }} {{ __('reward.bitcoin') }}"/>[m
         <p>{{ __('reward.bitcoin') }}</p>[m
       </div>[m
     {% endif %}[m
[1mdiff --git a/themes/next/layout/_macro/sidebar.swig b/themes/next/layout/_macro/sidebar.swig[m
[1mindex 1896fb0..b71be43 100644[m
[1m--- a/themes/next/layout/_macro/sidebar.swig[m
[1m+++ b/themes/next/layout/_macro/sidebar.swig[m
[36m@@ -29,59 +29,63 @@[m
       <section class="site-overview-wrap sidebar-panel{% if not display_toc or toc(page.content).length <= 1 %} sidebar-panel-active{% endif %}">[m
         <div class="site-overview">[m
           <div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">[m
[31m-            {% if theme.avatar %}[m
[32m+[m[32m            {% if theme.avatar.url %}[m
               <img class="site-author-image" itemprop="image"[m
[31m-                src="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}"[m
[31m-                alt="{{ theme.author }}" />[m
[32m+[m[32m                src="{{ url_for( theme.avatar.url | default(theme.images + '/avatar.gif') ) }}"[m
[32m+[m[32m                alt="{{ author }}" />[m
             {% endif %}[m
[31m-              <p class="site-author-name" itemprop="name">{{ theme.author }}</p>[m
[32m+[m[32m              <p class="site-author-name" itemprop="name">{{ author }}</p>[m
               <p class="site-description motion-element" itemprop="description">{#[m
[31m-            #}{% if theme.seo %}{#[m
[31m-              #}{{ theme.signature }}{#[m
[31m-            #}{% else %}{#[m
[31m-              #}{{ theme.description }}{#[m
[31m-            #}{% endif %}{#[m
[32m+[m[32m              #}{{ description }}{#[m
             #}</p>[m
           </div>[m
 [m
[31m-          <nav class="site-state motion-element">[m
[31m-[m
[31m-            {% if config.archive_dir != '/' and site.posts.length > 0 %}[m
[31m-              <div class="site-state-item site-state-posts">[m
[31m-              {% if theme.menu.archives %}[m
[31m-                <a href="{{ url_for(theme.menu.archives).split('||')[0] | trim }}">[m
[31m-              {% else %}[m
[31m-                <a href="{{ url_for(config.archive_dir) }}">[m
[32m+[m[32m          {% if theme.site_state %}[m
[32m+[m[32m            <nav class="site-state motion-element">[m
[32m+[m[32m              {% if config.archive_dir != '/' and site.posts.length > 0 %}[m
[32m+[m[32m                <div class="site-state-item site-state-posts">[m
[32m+[m[32m                {% if theme.menu.archives %}[m
[32m+[m[32m                  <a href="{{ url_for(theme.menu.archives).split('||')[0] | trim }}">[m
[32m+[m[32m                {% else %}[m
[32m+[m[32m                  <a href="{{ url_for(config.archive_dir) }}">[m
[32m+[m[32m                {% endif %}[m
[32m+[m[32m                    <span class="site-state-item-count">{{ site.posts.length }}</span>[m
[32m+[m[32m                    <span class="site-state-item-name">{{ __('state.posts') }}</span>[m
[32m+[m[32m                  </a>[m
[32m+[m[32m                </div>[m
               {% endif %}[m
[31m-                  <span class="site-state-item-count">{{ site.posts.length }}</span>[m
[31m-                  <span class="site-state-item-name">{{ __('state.posts') }}</span>[m
[31m-                </a>[m
[31m-              </div>[m
[31m-            {% endif %}[m
[31m-[m
[31m-            {% if site.categories.length > 0 %}[m
[31m-              {% set categoriesPageQuery = site.pages.find({type: 'categories'}, {lean: true}) %}[m
[31m-              {% set hasCategoriesPage = categoriesPageQuery.length > 0 %}[m
[31m-              <div class="site-state-item site-state-categories">[m
[31m-                {% if hasCategoriesPage %}<a href="{{ url_for(categoriesPageQuery[0].path) }}">{% endif %}[m
[31m-                  <span class="site-state-item-count">{{ site.categories.length }}</span>[m
[31m-                  <span class="site-state-item-name">{{ __('state.categories') }}</span>[m
[31m-                {% if hasCategoriesPage %}</a>{% endif %}[m
[31m-              </div>[m
[31m-            {% endif %}[m
 [m
[31m-            {% if site.tags.length > 0 %}[m
[31m-              {% set tagsPageQuery = site.pages.find({type: 'tags'}, {lean: true}) %}[m
[31m-              {% set hasTagsPage = tagsPageQuery.length > 0 %}[m
[31m-              <div class="site-state-item site-state-tags">[m
[31m-                {% if hasTagsPage %}<a href="{{ url_for(tagsPageQuery[0].path) }}">{% endif %}[m
[31m-                  <span class="site-state-item-count">{{ site.tags.length }}</span>[m
[31m-                  <span class="site-state-item-name">{{ __('state.tags') }}</span>[m
[31m-                {% if hasTagsPage %}</a>{% endif %}[m
[31m-              </div>[m
[31m-            {% endif %}[m
[32m+[m[32m              {% if site.categories.length > 0 %}[m
[32m+[m[32m                {% set categoriesPageQuery = site.pages.find({type: 'categories'}, {lean: true}) %}[m
[32m+[m[32m                {% set hasCategoriesPage = categoriesPageQuery.length > 0 %}[m
[32m+[m[32m                <div class="site-state-item site-state-categories">[m
[32m+[m[32m                  {% if hasCategoriesPage %}<a href="{{ url_for(categoriesPageQuery[0].path) }}">{% endif %}[m
[32m+[m[32m                    {% set visibleCategories = 0 %}[m
[32m+[m[32m                    {% for cat in site.categories %}[m
[32m+[m[32m                      {% if cat.length %}{% set visibleCategories += 1 %}{% endif %}[m
[32m+[m[32m                    {% endfor %}[m
[32m+[m[32m                    <span class="site-state-item-count">{{ visibleCategories }}</span>[m
[32m+[m[32m                    <span class="site-state-item-name">{{ __('state.categories') }}</span>[m
[32m+[m[32m                  {% if hasCategoriesPage %}</a>{% endif %}[m
[32m+[m[32m                </div>[m
[32m+[m[32m              {% endif %}[m
 [m
[31m-          </nav>[m
[32m+[m[32m              {% if site.tags.length > 0 %}[m
[32m+[m[32m                {% set tagsPageQuery = site.pages.find({type: 'tags'}, {lean: true}) %}[m
[32m+[m[32m                {% set hasTagsPage = tagsPageQuery.length > 0 %}[m
[32m+[m[32m                <div class="site-state-item site-state-tags">[m
[32m+[m[32m                  {% if hasTagsPage %}<a href="{{ url_for(tagsPageQuery[0].path) }}">{% endif %}[m
[32m+[m[32m                    {% set visibleTags = 0 %}[m
[32m+[m[32m                    {% for tag in site.tags %}[m
[32m+[m[32m                      {% if tag.length %}{% set visibleTags += 1 %}{% endif %}[m
[32m+[m[32m                    {% endfor %}[m
[32m+[m[32m                    <span class="site-state-item-count">{{ visibleTags }}</span>[m
[32m+[m[32m                    <span class="site-state-item-name">{{ __('state.tags') }}</span>[m
[32m+[m[32m                  {% if hasTagsPage %}</a>{% endif %}[m
[32m+[m[32m                </div>[m
[32m+[m[32m              {% endif %}[m
[32m+[m[32m            </nav>[m
[32m+[m[32m          {% endif %}[m
 [m
           {% if theme.rss %}[m
             <div class="feed-link motion-element">[m
[36m@@ -94,49 +98,39 @@[m
 [m
           {% if theme.social %}[m
             <div class="links-of-author motion-element">[m
[31m-                {% for name, link in theme.social %}[m
[31m-                  <span class="links-of-author-item">[m
[31m-                    <a href="{{ link.split('||')[0] | trim }}" target="_blank" title="{{ name }}">[m
[31m-                      {% if theme.social_icons.enable %}[m
[31m-                        <i class="fa fa-fw fa-{{ link.split('||')[1] | trim | default('globe') }}"></i>{#[m
[31m-                    #}{% endif %}{#[m
[31m-                      #}{% if not theme.social_icons.icons_only %}{#[m
[31m-                        #}{{ name }}{#[m
[31m-                      #}{% endif %}{#[m
[32m+[m[32m              {% for name, link in theme.social %}[m
[32m+[m[32m                <span class="links-of-author-item">[m
[32m+[m[32m                  {% if theme.exturl && theme.social_icons.exturl %}[m
[32m+[m[32m                    <span class="exturl" data-url="{{ link.split('||')[0] | trim }}" title="{{ name }}">{#[m
[32m+[m[32m                #}{% else %}{#[m
[32m+[m[32m                  #}<a href="{{ link.split('||')[0] | trim }}" target="_blank" title="{{ name }}"{% if theme.seo %} rel="external nofollow"{% endif %}>{#[m
[32m+[m[32m                #}{% endif %}{#[m
[32m+[m[32m                  #}{% if theme.social_icons.enable %}{#[m
[32m+[m[32m                    #}<i class="fa fa-fw fa-{{ link.split('||')[1] | trim | default('globe') }}"></i>{#[m
[32m+[m[32m                  #}{% endif %}{#[m
[32m+[m[32m                  #}{% if not theme.social_icons.icons_only %}{#[m
[32m+[m[32m                    #}{{ name }}{#[m
[32m+[m[32m                  #}{% endif %}{#[m
[32m+[m[32m                #}{% if theme.exturl && theme.social_icons.exturl %}{#[m
[32m+[m[32m                  #}</span>[m
[32m+[m[32m                  {% else %}{#[m
                   #}</a>[m
[31m-                  </span>[m
[31m-                {% endfor %}[m
[32m+[m[32m                  {% endif %}[m
[32m+[m[32m                </span>[m
[32m+[m[32m              {% endfor %}[m
             </div>[m
           {% endif %}[m
 [m
           {% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'zero': 1} %}[m
           {% if theme.creative_commons in cc %}[m
             <div class="cc-license motion-element" itemprop="license">[m
[31m-              <a href="https://creativecommons.org/{% if theme.creative_commons === 'zero' %}publicdomain/zero/1.0{% else %}licenses/{{ theme.creative_commons }}/4.0{% endif %}/" class="cc-opacity" target="_blank">[m
[32m+[m[32m              <a href="https://creativecommons.org/{% if theme.creative_commons === 'zero' %}publicdomain/zero/1.0{% else %}licenses/{{ theme.creative_commons }}/4.0{% endif %}/" class="cc-opacity" target="_blank"{% if theme.seo %} rel="external nofollow"{% endif %}>[m
                 <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.svg" alt="Creative Commons" />[m
               </a>[m
             </div>[m
           {% endif %}[m
 [m
           {# Blogroll #}[m
[31m-          {% if theme.recent_posts %}[m
[31m-              <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.recent_posts_layout  }}">[m
[31m-                <div class="links-of-blogroll-title">[m
[31m-                  <!-- modify icon to fire by szw -->[m
[31m-                  <i class="fa fa-history fa-{{ theme.recent_posts_icon | lower }}" aria-hidden="true"></i>[m
[31m-                  {{ theme.recent_posts_title }}[m
[31m-                </div>[m
[31m-                <ul class="links-of-blogroll-list">[m
[31m-                  {% set posts = site.posts.sort('-date') %}[m
[31m-                  {% for post in posts.slice('0', '5') %}[m
[31m-                    <li>[m
[31m-                      <a href="{{ url_for(post.path) }}" title="{{ post.title }}">{{ post.title }}</a>[m
[31m-                    </li>[m
[31m-                  {% endfor %}[m
[31m-                </ul>[m
[31m-              </div>[m
[31m-          {% endif %}[m
[31m-[m
           {% if theme.links %}[m
             <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.links_layout | default('inline') }}">[m
               <div class="links-of-blogroll-title">[m
[36m@@ -153,7 +147,12 @@[m
             </div>[m
           {% endif %}[m
 [m
[31m-          {% include '../_custom/sidebar.swig' %}[m
[32m+[m[32m          {% if theme.custom_file_path.sidebar %}[m
[32m+[m[32m            {% set custom_sidebar = '../../../../' + theme.custom_file_path.sidebar %}[m
[32m+[m[32m          {% else %}[m
[32m+[m[32m            {% set custom_sidebar = '../_custom/sidebar.swig' %}[m
[32m+[m[32m          {% endif %}[m
[32m+[m[32m          {% include custom_sidebar %}[m
         </div>[m
       </section>[m
 [m
[1mdiff --git a/themes/next/layout/_macro/wechat-subscriber.swig b/themes/next/layout/_macro/wechat-subscriber.swig[m
[1mindex b1d4364..aa0fdbc 100644[m
[1m--- a/themes/next/layout/_macro/wechat-subscriber.swig[m
[1m+++ b/themes/next/layout/_macro/wechat-subscriber.swig[m
[36m@@ -1,4 +1,4 @@[m
 <div id="wechat_subscriber" style="display: block; padding: 10px 0; margin: 20px auto; width: 100%; text-align: center">[m
[31m-    <img id="wechat_subscriber_qcode" src="{{ theme.wechat_subscriber.qcode }}" alt="{{ theme.author }} wechat" style="width: 200px; max-width: 100%;"/>[m
[32m+[m[32m    <img id="wechat_subscriber_qcode" src="{{ url_for(theme.wechat_subscriber.qcode) }}" alt="{{ author }} wechat" style="width: 200px; max-width: 100%;"/>[m
     <div>{{ theme.wechat_subscriber.description }}</div>[m
 </div>[m
[1mdiff --git a/themes/next/layout/_partials/comments.swig b/themes/next/layout/_partials/comments.swig[m
[1mindex cee3114..4124b9a 100644[m
[1m--- a/themes/next/layout/_partials/comments.swig[m
[1m+++ b/themes/next/layout/_partials/comments.swig[m
[36m@@ -1,13 +1,6 @@[m
 {% if page.comments %}[m
 [m
[31m-  {% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}[m
[31m-    <div class="comments" id="comments">[m
[31m-      <div class="ds-thread" data-thread-key="{{ page.path }}"[m
[31m-           data-title="{{ page.title }}" data-url="{{ page.permalink }}">[m
[31m-      </div>[m
[31m-    </div>[m
[31m-[m
[31m-  {% elseif theme.facebook_sdk.enable and theme.facebook_comments_plugin.enable %}[m
[32m+[m[32m  {% if theme.facebook_sdk.enable and theme.facebook_comments_plugin.enable %}[m
     <div class="comments" id="comments">[m
       <div class="fb-comments"[m
            data-href="{{ page.permalink }}"[m
[36m@@ -47,7 +40,7 @@[m
       <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>[m
     </div>[m
 [m
[31m-  {% elseif theme.changyan.appid and theme.changyan.appkey %}[m
[32m+[m[32m  {% elseif theme.changyan.enable and theme.changyan.appid and theme.changyan.appkey %}[m
     <div class="comments" id="comments">[m
       <div id="SOHUCS"></div>[m
     </div>[m
[36m@@ -62,7 +55,7 @@[m
       {% endif %}[m
     </div>[m
 [m
[31m-  {% elseif theme.valine.appid and theme.valine.appkey %}[m
[32m+[m[32m  {% elseif theme.valine.enable and theme.valine.appid and theme.valine.appkey %}[m
     <div class="comments" id="comments">[m
     </div>[m
   {% endif %}[m
[1mdiff --git a/themes/next/layout/_partials/footer.swig b/themes/next/layout/_partials/footer.swig[m
[1mindex aa0be0b..a0ec48e 100644[m
[1m--- a/themes/next/layout/_partials/footer.swig[m
[1m+++ b/themes/next/layout/_partials/footer.swig[m
[36m@@ -2,59 +2,60 @@[m
 #}{% set current = date(Date.now(), "YYYY") %}{#[m
 #}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} &mdash; {% endif %}{#[m
 #}<span itemprop="copyrightYear">{{ current }}</span>[m
[31m-  <span class="with-love">[m
[31m-    <i class="fa fa-{{ theme.footer.icon }}"></i>[m
[32m+[m[32m  <span class="with-love" id="animate">[m
[32m+[m[32m    <i class="fa fa-{{ theme.footer.icon.name }}"></i>[m
   </span>[m
[31m-  <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>[m
[31m-  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || config.author }}</span>[m
[32m+[m[32m  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright | default(author) }}</span>[m
 [m
[31m-  {% if theme.post_wordcount.totalcount %}[m
[32m+[m[32m  {% if config.symbols_count_time.total_symbols %}[m
     <span class="post-meta-divider">|</span>[m
     <span class="post-meta-item-icon">[m
       <i class="fa fa-area-chart"></i>[m
     </span>[m
[31m-    {% if theme.post_wordcount.item_text %}[m
[31m-      <span class="post-meta-item-text">{{ __('post.totalcount') }}&#58;</span>[m
[32m+[m[32m    {% if theme.symbols_count_time.item_text_total %}[m
[32m+[m[32m      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>[m
     {% endif %}[m
[31m-    <span title="{{ __('post.totalcount') }}">{#[m
[31m-    #}{{ totalcount(site, '0,0.0a') }}{#[m
[32m+[m[32m    <span title="{{ __('symbols_count_time.count_total') }}">{#[m
[32m+[m[32m    #}{{ symbolsCountTotal(site) }}{#[m
   #}</span>[m
   {% endif %}[m
[31m-</div>[m
 [m
[31m-<div class="powered-by">[m
[31m-  <i class="fa fa-eye"></i>[m
[31m-  <span id="busuanzi_container_site_pv">[m
[31m-    本站总访问量<span id="busuanzi_value_site_pv"></span>次[m
[31m-  </span>[m
[31m-  <i class="fa fa-users"></i>[m
[31m-  <span id="busuanzi_container_site_uv">[m
[31m-    本站访客数:<span id="busuanzi_value_site_uv"></span>[m
[31m-  </span>[m
[32m+[m[32m  {% if config.symbols_count_time.total_time %}[m
[32m+[m[32m    <span class="post-meta-divider">|</span>[m
[32m+[m[32m    <span class="post-meta-item-icon">[m
[32m+[m[32m      <i class="fa fa-coffee"></i>[m
[32m+[m[32m    </span>[m
[32m+[m[32m    {% if theme.symbols_count_time.item_text_total %}[m
[32m+[m[32m      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total')}} &asymp;</span>[m
[32m+[m[32m    {% endif %}[m
[32m+[m[32m    <span title="{{ __('symbols_count_time.time_total') }}">{#[m
[32m+[m[32m    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}{#[m
[32m+[m[32m  #}</span>[m
[32m+[m[32m  {% endif %}[m
 </div>[m
 [m
[31m-<br/>[m
[32m+[m[32m{% if theme.seo %}[m
[32m+[m[32m  {% set nofollow = ' rel="external nofollow"' %}[m
[32m+[m[32m{% endif %}[m
 [m
[31m-<!--[m
[31m-{% if theme.footer.powered %}[m
[32m+[m[32m{% if theme.footer.powered.enable %}[m
   <div class="powered-by">{#[m
[31m-  #}{{ __('footer.powered', '<a class="theme-link" target="_blank" href="https://hexo.io">Hexo</a>') }}{#[m
[32m+[m[32m  #}{{ __('footer.powered', '<a class="theme-link" target="_blank"' + nofollow + ' href="https://hexo.io">Hexo</a>') }}{% if theme.footer.powered.version %} v{{ hexo_env('version') }}{% endif %}{#[m
 #}</div>[m
 {% endif %}[m
 [m
[31m-{% if theme.footer.powered and theme.footer.theme.enable %}[m
[32m+[m[32m{% if theme.footer.powered.enable and theme.footer.theme.enable %}[m
   <span class="post-meta-divider">|</span>[m
 {% endif %}[m
 [m
 {% if theme.footer.theme.enable %}[m
   <div class="theme-info">{#[m
   #}{{ __('footer.theme') }} &mdash; {#[m
[31m-  #}<a class="theme-link" target="_blank" href="https://github.com/iissnan/hexo-theme-next">{#[m
[32m+[m[32m  #}<a class="theme-link" target="_blank"{{ nofollow }} href="https://github.com/theme-next/hexo-theme-next">{#[m
     #}NexT.{{ theme.scheme }}{#[m
[31m-  #}</a>{% if theme.footer.theme.version %} v{{ theme.version }}{% endif %}{#[m
[32m+[m[32m  #}</a>{% if theme.footer.theme.version %} v{{ version }}{% endif %}{#[m
 #}</div>[m
 {% endif %}[m
[31m--->[m
 [m
 {% if theme.footer.custom_text %}[m
   <div class="footer-custom">{#[m
[1mdiff --git a/themes/next/layout/_partials/page-header.swig b/themes/next/layout/_partials/page-header.swig[m
[1mindex 1e1f890..8fb71c6 100644[m
[1m--- a/themes/next/layout/_partials/page-header.swig[m
[1m+++ b/themes/next/layout/_partials/page-header.swig[m
[36m@@ -1,11 +1,12 @@[m
 <header class="post-header">[m
 [m
[31m-	<{% if theme.seo %}h2{% else %}h1{% endif %} class="post-title" itemprop="name headline">{{ page.title }}</{% if theme.seo %}h2{% else %}h1{% endif %}>[m
[32m+[m[32m<{% if theme.seo %}h2{% else %}h1{% endif %} class="post-title" itemprop="name headline">{{ page.title }}</{% if theme.seo %}h2{% else %}h1{% endif %}>[m
 [m
[31m-{% if page.description %}[m
[31m-	<div class="post-meta">[m
[31m-		<div class="post-description">{{ page.description }}</div>[m
[31m-	</div>[m
[31m-{% endif %}[m
[32m+[m[32m<div class="post-meta">[m
[32m+[m[32m  {% if page.description %}[m
[32m+[m[32m    <div class="post-description">{{ page.description }}</div>[m
[32m+[m[32m  {% endif %}[m
[32m+[m[32m  {% include 'breadcrumb.swig' %}[m
[32m+[m[32m</div>[m
 [m
 </header>[m
[1mdiff --git a/themes/next/layout/_partials/pagination.swig b/themes/next/layout/_partials/pagination.swig[m
[1mindex 5f96b99..1038580 100644[m
[1m--- a/themes/next/layout/_partials/pagination.swig[m
[1m+++ b/themes/next/layout/_partials/pagination.swig[m
[36m@@ -2,8 +2,8 @@[m
   <nav class="pagination">[m
     {{[m
       paginator({[m
[31m-        prev_text: '<i class="fa fa-angle-left"></i>',[m
[31m-        next_text: '<i class="fa fa-angle-right"></i>',[m
[32m+[m[32m        prev_text: '<i class="fa fa-angle-left" aria-label="'+__('accessibility.prev_page')+'"></i>',[m
[32m+[m[32m        next_text: '<i class="fa fa-angle-right" aria-label="'+__('accessibility.next_page')+'"></i>',[m
         mid_size: 1[m
       })[m
     }}[m
[1mdiff --git a/themes/next/layout/_scripts/boostrap.swig b/themes/next/layout/_scripts/boostrap.swig[m
[1mindex 5e95090..1bf5ab5 100644[m
[1m--- a/themes/next/layout/_scripts/boostrap.swig[m
[1m+++ b/themes/next/layout/_scripts/boostrap.swig[m
[36m@@ -5,5 +5,5 @@[m
 %}[m
 [m
 {% for bs in boot_scripts %}[m
[31m-  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ bs }}?v={{ theme.version }}"></script>[m
[32m+[m[32m  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ bs }}?v={{ version }}"></script>[m
 {% endfor %}[m
[1mdiff --git a/themes/next/layout/_scripts/commons.swig b/themes/next/layout/_scripts/commons.swig[m
[1mindex abc2971..c99e727 100644[m
[1m--- a/themes/next/layout/_scripts/commons.swig[m
[1m+++ b/themes/next/layout/_scripts/commons.swig[m
[36m@@ -6,5 +6,5 @@[m
 %}[m
 [m
 {% for common in js_commons %}[m
[31m-  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ common }}?v={{ theme.version }}"></script>[m
[32m+[m[32m  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ common }}?v={{ version }}"></script>[m
 {% endfor %}[m
[1mdiff --git a/themes/next/layout/_scripts/pages/post-details.swig b/themes/next/layout/_scripts/pages/post-details.swig[m
[1mindex 6938779..c9f7634 100644[m
[1m--- a/themes/next/layout/_scripts/pages/post-details.swig[m
[1m+++ b/themes/next/layout/_scripts/pages/post-details.swig[m
[36m@@ -1,2 +1,2 @@[m
[31m-<script type="text/javascript" src="{{ url_for(theme.js) }}/src/scrollspy.js?v={{ theme.version }}"></script>[m
[31m-<script type="text/javascript" src="{{ url_for(theme.js) }}/src/post-details.js?v={{ theme.version }}"></script>[m
[32m+[m[32m<script type="text/javascript" src="{{ url_for(theme.js) }}/src/scrollspy.js?v={{ version }}"></script>[m
[32m+[m[32m<script type="text/javascript" src="{{ url_for(theme.js) }}/src/post-details.js?v={{ version }}"></script>[m
[1mdiff --git a/themes/next/layout/_scripts/schemes/gemini.swig b/themes/next/layout/_scripts/schemes/gemini.swig[m
[1mindex 5119eba..676db4e 100644[m
[1m--- a/themes/next/layout/_scripts/schemes/gemini.swig[m
[1m+++ b/themes/next/layout/_scripts/schemes/gemini.swig[m
[36m@@ -6,5 +6,5 @@[m
 %}[m
 [m
 {% for script in scripts %}[m
[31m-  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ script }}?v={{ theme.version }}"></script>[m
[32m+[m[32m  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ script }}?v={{ version }}"></script>[m
 {% endfor %}[m
[1mdiff --git a/themes/next/layout/_scripts/schemes/pisces.swig b/themes/next/layout/_scripts/schemes/pisces.swig[m
[1mindex 5119eba..676db4e 100644[m
[1m--- a/themes/next/layout/_scripts/schemes/pisces.swig[m
[1m+++ b/themes/next/layout/_scripts/schemes/pisces.swig[m
[36m@@ -6,5 +6,5 @@[m
 %}[m
 [m
 {% for script in scripts %}[m
[31m-  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ script }}?v={{ theme.version }}"></script>[m
[32m+[m[32m  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ script }}?v={{ version }}"></script>[m
 {% endfor %}[m
[1mdiff --git a/themes/next/layout/_scripts/vendors.swig b/themes/next/layout/_scripts/vendors.swig[m
[1mindex d0b86fd..5e8bf01 100644[m
[1m--- a/themes/next/layout/_scripts/vendors.swig[m
[1m+++ b/themes/next/layout/_scripts/vendors.swig[m
[36m@@ -8,14 +8,22 @@[m
 [m
 {% set js_vendors = {} %}[m
 {% set js_vendors.jquery      = 'jquery/index.js?v=2.1.3' %}[m
[31m-{% set js_vendors.fastclick   = 'fastclick/lib/fastclick.min.js?v=1.0.6' %}[m
[31m-{% set js_vendors.lazyload    = 'jquery_lazyload/jquery.lazyload.js?v=1.9.7' %}[m
[32m+[m
[32m+[m[32m{% if theme.fastclick %}[m
[32m+[m[32m  {% set js_vendors.fastclick   = 'fastclick/lib/fastclick.min.js?v=1.0.6' %}[m
[32m+[m[32m{% endif %}[m
[32m+[m
[32m+[m[32m{% if theme.lazyload %}[m
[32m+[m[32m  {% set js_vendors.lazyload    = 'jquery_lazyload/jquery.lazyload.js?v=1.9.7' %}[m
[32m+[m[32m{% endif %}[m
[32m+[m
 {% set js_vendors.velocity    = 'velocity/velocity.min.js?v=1.2.1' %}[m
 {% set js_vendors.velocity_ui = 'velocity/velocity.ui.min.js?v=1.2.1' %}[m
 [m
 {% if theme.fancybox %}[m
   {% set js_vendors.fancybox  = 'fancybox/source/jquery.fancybox.pack.js?v=2.1.5' %}[m
 {% endif %}[m
[32m+[m
 {% if theme.canvas_nest %}[m
   {% set js_vendors.canvas_nest  = 'canvas-nest/canvas-nest.min.js' %}[m
 {% endif %}[m
[36m@@ -39,6 +47,10 @@[m
   {% set js_vendors.canvas_ribbon  = 'canvas-ribbon/canvas-ribbon.js' %}[m
 {% endif %}[m
 [m
[32m+[m[32m{% if theme.reading_progress.enable %}[m
[32m+[m[32m  {% set js_vendors.reading_progress  = 'reading_progress/reading_progress.js' %}[m
[32m+[m[32m{% endif %}[m
[32m+[m
 {% for name, internal in js_vendors %}[m
   {% set internal_script = url_for(theme.vendors._internal) + '/' + internal %}[m
   {% if name == 'canvas_ribbon' %}[m
[1mdiff --git a/themes/next/layout/_third-party/analytics/busuanzi-counter.swig b/themes/next/layout/_third-party/analytics/busuanzi-counter.swig[m
[1mindex 721b2c8..880e986 100644[m
[1m--- a/themes/next/layout/_third-party/analytics/busuanzi-counter.swig[m
[1m+++ b/themes/next/layout/_third-party/analytics/busuanzi-counter.swig[m
[36m@@ -2,20 +2,19 @@[m
 <div class="busuanzi-count">[m
   <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>[m
 [m
[31m-  {% if theme.busuanzi_count.site_uv %}[m
[31m-    <span class="site-uv">[m
[31m-      {{ theme.busuanzi_count.site_uv_header }}[m
[32m+[m[32m  {% if theme.busuanzi_count.total_visitors %}[m
[32m+[m[32m    <span class="site-uv" title="{{ __('footer.total_visitors') }}">[m
[32m+[m[32m      <i class="fa fa-{{ theme.busuanzi_count.total_visitors_icon }}"></i>[m
       <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>[m
[31m-      {{ theme.busuanzi_count.site_uv_footer }}[m
     </span>[m
   {% endif %}[m
 [m
[31m-  {% if theme.busuanzi_count.site_pv %}[m
[31m-    <span class="site-pv">[m
[31m-      {{ theme.busuanzi_count.site_pv_header }}[m
[32m+[m[32m  {% if theme.busuanzi_count.total_views %}[m
[32m+[m[32m    <span class="site-pv" title="{{ __('footer.total_views') }}">[m
[32m+[m[32m      <i class="fa fa-{{ theme.busuanzi_count.total_views_icon }}"></i>[m
       <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>[m
[31m-      {{ theme.busuanzi_count.site_pv_footer }}[m
     </span>[m
   {% endif %}[m
 </div>[m
 {% endif %}[m
[41m+[m
[1mdiff --git a/themes/next/layout/_third-party/analytics/firestore.swig b/themes/next/layout/_third-party/analytics/firestore.swig[m
[1mindex 7493c75..9e5cb76 100644[m
[1m--- a/themes/next/layout/_third-party/analytics/firestore.swig[m
[1m+++ b/themes/next/layout/_third-party/analytics/firestore.swig[m
[36m@@ -56,7 +56,7 @@[m
               $('<span>').addClass('post-meta-item-icon').append([m
                 $('<i>').addClass('fa fa-users')[m
               )[m
[31m-              ).append($('<span>').text('{{ __("post.visitors")}} ' + count))[m
[32m+[m[32m              ).append($('<span>').text('{{ __("post.views")}} ' + count))[m
           )[m
         }[m
       }[m
[1mdiff --git a/themes/next/layout/_third-party/analytics/google-analytics.swig b/themes/next/layout/_third-party/analytics/google-analytics.swig[m
[1mindex c66d461..1190bab 100644[m
[1m--- a/themes/next/layout/_third-party/analytics/google-analytics.swig[m
[1m+++ b/themes/next/layout/_third-party/analytics/google-analytics.swig[m
[36m@@ -1,10 +1,10 @@[m
 {% if theme.google_analytics %}[m
[32m+[m[32m<script async src="https://www.googletagmanager.com/gtag/js?id={{ theme.google_analytics }}"></script>[m
 <script>[m
[31m-  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){[m
[31m-            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),[m
[31m-          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)[m
[31m-  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');[m
[31m-  ga('create', '{{ theme.google_analytics }}', 'auto');[m
[31m-  ga('send', 'pageview');[m
[32m+[m[32m  window.dataLayer = window.dataLayer || [];[m
[32m+[m[32m  function gtag(){dataLayer.push(arguments);}[m
[32m+[m[32m  gtag('js', new Date());[m
[32m+[m
[32m+[m[32m  gtag('config', '{{ theme.google_analytics }}');[m
 </script>[m
[31m-{% endif %}[m
\ No newline at end of file[m
[32m+[m[32m{% endif %}[m
[1mdiff --git a/themes/next/layout/_third-party/analytics/lean-analytics.swig b/themes/next/layout/_third-party/analytics/lean-analytics.swig[m
[1mindex 2e8bb98..4649647 100644[m
[1m--- a/themes/next/layout/_third-party/analytics/lean-analytics.swig[m
[1m+++ b/themes/next/layout/_third-party/analytics/lean-analytics.swig[m
[36m@@ -1,6 +1,6 @@[m
 {% if theme.leancloud_visitors.enable %}[m
 [m
[31m-  {# custom analytics part create by xiamo #}[m
[32m+[m[32m  {# custom analytics part create by xiamo; edited by LEAFERx #}[m
   <script src="https://cdn1.lncld.net/static/js/av-core-mini-0.6.4.js"></script>[m
   <script>AV.initialize("{{theme.leancloud_visitors.app_id}}", "{{theme.leancloud_visitors.app_key}}");</script>[m
   <script>[m
[36m@@ -58,35 +58,47 @@[m
             var counter = results[0];[m
             counter.fetchWhenSave(true);[m
             counter.increment("time");[m
[32m+[m[32m            {% if theme.leancloud_visitors.betterPerformance %}[m
[32m+[m[32m              var $element = $(document.getElementById(url));[m
[32m+[m[32m              $element.find('.leancloud-visitors-count').text(counter.get('time'));[m
[32m+[m[32m            {% endif %}[m
             counter.save(null, {[m
               success: function(counter) {[m
[31m-                var $element = $(document.getElementById(url));[m
[31m-                $element.find('.leancloud-visitors-count').text(counter.get('time'));[m
[32m+[m[32m                {% if not theme.leancloud_visitors.betterPerformance %}[m
[32m+[m[32m                  var $element = $(document.getElementById(url));[m
[32m+[m[32m                  $element.find('.leancloud-visitors-count').text(counter.get('time'));[m
[32m+[m[32m                {% endif %}[m
               },[m
               error: function(counter, error) {[m
                 console.log('Failed to save Visitor num, with error message: ' + error.message);[m
               }[m
             });[m
           } else {[m
[31m-            var newcounter = new Counter();[m
[31m-            /* Set ACL */[m
[31m-            var acl = new AV.ACL();[m
[31m-            acl.setPublicReadAccess(true);[m
[31m-            acl.setPublicWriteAccess(true);[m
[31m-            newcounter.setACL(acl);[m
[31m-            /* End Set ACL */[m
[31m-            newcounter.set("title", title);[m
[31m-            newcounter.set("url", url);[m
[31m-            newcounter.set("time", 1);[m
[31m-            newcounter.save(null, {[m
[31m-              success: function(newcounter) {[m
[31m-                var $element = $(document.getElementById(url));[m
[31m-                $element.find('.leancloud-visitors-count').text(newcounter.get('time'));[m
[31m-              },[m
[31m-              error: function(newcounter, error) {[m
[31m-                console.log('Failed to create');[m
[31m-              }[m
[31m-            });[m
[32m+[m[32m            {% if theme.leancloud_visitors.security %}[m
[32m+[m[32m              var $element = $(document.getElementById(url));[m
[32m+[m[32m              $element.find('.leancloud-visitors-count').text('Counter not initialized! See more at console err msg.');[m
[32m+[m[32m              console.error('ATTENTION! LeanCloud counter has security bug, see here how to solve it: https://github.com/theme-next/hexo-leancloud-counter-security. \n But you also can use LeanCloud without security, by set \'security\' option to \'false\'.');[m
[32m+[m[32m            {% else %}[m
[32m+[m[32m              var newcounter = new Counter();[m
[32m+[m[32m              /* Set ACL */[m
[32m+[m[32m              var acl = new AV.ACL();[m
[32m+[m[32m              acl.setPublicReadAccess(true);[m
[32m+[m[32m              acl.setPublicWriteAccess(true);[m
[32m+[m[32m              newcounter.setACL(acl);[m
[32m+[m[32m              /* End Set ACL */[m
[32m+[m[32m              newcounter.set("title", title);[m
[32m+[m[32m              newcounter.set("url", url);[m
[32m+[m[32m              newcounter.set("time", 1);[m
[32m+[m[32m              newcounter.save(null, {[m
[32m+[m[32m                success: function(newcounter) {[m
[32m+[m[32m                  var $element = $(document.getElementById(url));[m
[32m+[m[32m                  $element.find('.leancloud-visitors-count').text(newcounter.get('time'));[m
[32m+[m[32m                },[m
[32m+[m[32m                error: function(newcounter, error) {[m
[32m+[m[32m                  console.log('Failed to create');[m
[32m+[m[32m                }[m
[32m+[m[32m              });[m
[32m+[m[32m            {% endif %}[m
           }[m
         },[m
         error: function(error) {[m
[1mdiff --git a/themes/next/layout/_third-party/comments/disqus.swig b/themes/next/layout/_third-party/comments/disqus.swig[m
[1mindex 2d14907..7ff74d0 100644[m
[1m--- a/themes/next/layout/_third-party/comments/disqus.swig[m
[1m+++ b/themes/next/layout/_third-party/comments/disqus.swig[m
[36m@@ -1,23 +1,45 @@[m
[31m-{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname %}[m
[31m-  {% if theme.disqus.enable %}[m
[32m+[m[32m{% if theme.disqus.enable %}[m
 [m
[31m-    {% if theme.disqus.count  %}[m
[31m-      <script id="dsq-count-scr" src="https://{{theme.disqus.shortname}}.disqus.com/count.js" async></script>[m
[31m-    {% endif %}[m
[32m+[m[32m  {% if theme.disqus.count %}[m
[32m+[m[32m    <script id="dsq-count-scr" src="https://{{theme.disqus.shortname}}.disqus.com/count.js" async></script>[m
[32m+[m[32m  {% endif %}[m
 [m
[31m-    {% if page.comments %}[m
[31m-      <script type="text/javascript">[m
[31m-        var disqus_config = function () {[m
[31m-          this.page.url = '{{ page.permalink }}';[m
[31m-          this.page.identifier = '{{ page.path }}';[m
[31m-          this.page.title = '{{ page.title| addslashes }}';[m
[31m-        };[m
[32m+[m[32m  {% if page.comments %}[m
[32m+[m[32m    <script type="text/javascript">[m
[32m+[m[32m      var disqus_config = function () {[m
[32m+[m[32m        this.page.url = '{{ page.permalink }}';[m
[32m+[m[32m        this.page.identifier = '{{ page.path }}';[m
[32m+[m[32m        this.page.title = '{{ page.title| addslashes }}';[m
[32m+[m[32m        {% if __('disqus') !== 'disqus' -%}[m
[32m+[m[32m          this.language = '{{ __('disqus') }}';[m
[32m+[m[32m        {% endif -%}[m
[32m+[m[32m      };[m
[32m+[m[32m      function loadComments () {[m
         var d = document, s = d.createElement('script');[m
         s.src = 'https://{{theme.disqus.shortname}}.disqus.com/embed.js';[m
         s.setAttribute('data-timestamp', '' + +new Date());[m
         (d.head || d.body).appendChild(s);[m
[31m-      </script>[m
[31m-    {% endif %}[m
[31m-[m
[32m+[m[32m      }[m
[32m+[m[32m      {% if theme.disqus.lazyload %}[m
[32m+[m[32m        $(function () {[m
[32m+[m[32m          var offsetTop = $('#comments').offset().top - $(window).height();[m
[32m+[m[32m          if (offsetTop <= 0) {[m
[32m+[m[32m            // load directly when there's no a scrollbar[m
[32m+[m[32m            loadComments();[m
[32m+[m[32m          } else {[m
[32m+[m[32m            $(window).on('scroll.disqus_scroll', function () {[m
[32m+[m[32m              var scrollTop = document.documentElement.scrollTop;[m
[32m+[m[32m              if (scrollTop >= offsetTop) {[m
[32m+[m[32m                $(window).off('.disqus_scroll');[m
[32m+[m[32m                loadComments();[m
[32m+[m[32m              }[m
[32m+[m[32m            });[m
[32m+[m[32m          }[m
[32m+[m[32m        });[m
[32m+[m[32m      {% else %}[m
[32m+[m[32m        loadComments();[m
[32m+[m[32m      {% endif %}[m
[32m+[m[32m    </script>[m
   {% endif %}[m
[32m+[m
 {% endif %}[m
[1mdiff --git a/themes/next/layout/_third-party/comments/gitment.swig b/themes/next/layout/_third-party/comments/gitment.swig[m
[1mindex 398779e..edf415f 100644[m
[1m--- a/themes/next/layout/_third-party/comments/gitment.swig[m
[1m+++ b/themes/next/layout/_third-party/comments/gitment.swig[m
[36m@@ -1,4 +1,3 @@[m
[31m-{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname %}[m
 {% if theme.gitment.enable and theme.gitment.client_id %}[m
 <!-- LOCAL: You can save these files to your site and update links -->[m
     {% if theme.gitment.mint %}[m
[36m@@ -23,7 +22,7 @@[m
       <script type="text/javascript">[m
       function renderGitment(){[m
         var gitment = new {{CommentsClass}}({[m
[31m-            id: window.location.pathname, [m
[32m+[m[32m            id: window.location.pathname,[m
             owner: '{{ theme.gitment.github_user }}',[m
             repo: '{{ theme.gitment.github_repo }}',[m
             {% if theme.gitment.mint %}[m
[36m@@ -56,4 +55,3 @@[m
     {% endif %}[m
 [m
 {% endif %}[m
[31m-{% endif %}[m
[1mdiff --git a/themes/next/layout/_third-party/comments/hypercomments.swig b/themes/next/layout/_third-party/comments/hypercomments.swig[m
[1mindex de693e4..c90ee1c 100644[m
[1m--- a/themes/next/layout/_third-party/comments/hypercomments.swig[m
[1m+++ b/themes/next/layout/_third-party/comments/hypercomments.swig[m
[36m@@ -1,4 +1,4 @@[m
[31m-{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname and not theme.disqus_shortname %}[m
[32m+[m[32m{% if not theme.disqus_shortname %}[m
 [m
 	{% if theme.hypercomments_id %}[m
 [m
[1mdiff --git a/themes/next/layout/_third-party/comments/index.swig b/themes/next/layout/_third-party/comments/index.swig[m
[1mindex b2da232..f9db12d 100644[m
[1m--- a/themes/next/layout/_third-party/comments/index.swig[m
[1m+++ b/themes/next/layout/_third-party/comments/index.swig[m
[36m@@ -1,4 +1,3 @@[m
[31m-{% include 'duoshuo.swig' %}[m
 {% include 'disqus.swig' %}[m
 {% include 'hypercomments.swig' %}[m
 {% include 'youyan.swig' %}[m
[1mdiff --git a/themes/next/layout/_third-party/comments/livere.swig b/themes/next/layout/_third-party/comments/livere.swig[m
[1mindex 9e1e165..99f9b4e 100644[m
[1m--- a/themes/next/layout/_third-party/comments/livere.swig[m
[1m+++ b/themes/next/layout/_third-party/comments/livere.swig[m
[36m@@ -1,4 +1,4 @@[m
[31m-{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname and not (theme.disqus.enable and theme.disqus.shortname) and not theme.hypercomments_id %}[m
[32m+[m[32m{% if not (theme.disqus.enable and theme.disqus.shortname) and not theme.hypercomments_id %}[m
 [m
   {% if page.comments and theme.livere_uid %}[m
     <script type="text/javascript">[m
[1mdiff --git a/themes/next/layout/_third-party/comments/valine.swig b/themes/next/layout/_third-party/comments/valine.swig[m
[1mindex 9bf5663..a5d09ee 100644[m
[1m--- a/themes/next/layout/_third-party/comments/valine.swig[m
[1m+++ b/themes/next/layout/_third-party/comments/valine.swig[m
[36m@@ -1,11 +1,15 @@[m
 {% if theme.valine.enable and theme.valine.appid and theme.valine.appkey %}[m
   <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>[m
[31m-  <script src="//unpkg.com/valine/dist/Valine.min.js"></script>[m
[32m+[m[32m  {% set valine_uri = '//unpkg.com/valine/dist/Valine.min.js' %}[m
[32m+[m[32m  {% if theme.vendors.valine %}[m
[32m+[m[32m    {% set valine_uri = theme.vendors.valine %}[m
[32m+[m[32m  {% endif %}[m
[32m+[m[32m  <script src="{{ valine_uri }}"></script>[m
   [m
   <script type="text/javascript">[m
     var GUEST = ['nick','mail','link'];[m
     var guest = '{{ theme.valine.guest_info }}';[m
[31m-    guest = guest.split(',').filter(item=>{[m
[32m+[m[32m    guest = guest.split(',').filter(function (item) {[m
       return GUEST.indexOf(item)>-1;[m
     });[m
     new Valine({[m
[1mdiff --git a/themes/next/layout/_third-party/comments/youyan.swig b/themes/next/layout/_third-party/comments/youyan.swig[m
[1mindex dbf3e8a..68dae72 100644[m
[1m--- a/themes/next/layout/_third-party/comments/youyan.swig[m
[1m+++ b/themes/next/layout/_third-party/comments/youyan.swig[m
[36m@@ -1,6 +1,4 @@[m
[31m-{% if not (theme.duoshuo and theme.duoshuo.shortname)[m
[31m-  and not theme.duoshuo_shortname[m
[31m-  and not theme.disqus_shortname[m
[32m+[m[32m{% if not theme.disqus_shortname[m
   and not theme.hypercomments_id %}[m
 [m
   {% if theme.youyan_uid %}[m
[1mdiff --git a/themes/next/layout/_third-party/exturl.swig b/themes/next/layout/_third-party/exturl.swig[m
[1mindex 329ab50..0a416c3 100644[m
[1m--- a/themes/next/layout/_third-party/exturl.swig[m
[1m+++ b/themes/next/layout/_third-party/exturl.swig[m
[36m@@ -1,3 +1,3 @@[m
 {% if theme.exturl %}[m
[31m-  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/exturl.js?v={{ theme.version }}"></script>[m
[32m+[m[32m  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/exturl.js?v={{ version }}"></script>[m
 {% endif %}[m
[1mdiff --git a/themes/next/layout/_third-party/needsharebutton.swig b/themes/next/layout/_third-party/needsharebutton.swig[m
[1mindex 73d8e4b..9120520 100644[m
[1m--- a/themes/next/layout/_third-party/needsharebutton.swig[m
[1m+++ b/themes/next/layout/_third-party/needsharebutton.swig[m
[36m@@ -1,10 +1,4 @@[m
 {% if theme.needmoreshare2.enable %}[m
[31m-  {% set needmoreshare2_css = url_for(theme.vendors._internal + '/needsharebutton/needsharebutton.css') %}[m
[31m-  {% if theme.vendors.needmoreshare2 %}[m
[31m-    {% set needmoreshare2_css = theme.vendors.needmoreshare2_css %}[m
[31m-  {% endif %}[m
[31m-  <link rel="stylesheet" href="{{ needmoreshare2_css }}">[m
[31m-[m
   {% set needmoreshare2_js = url_for(theme.vendors._internal + '/needsharebutton/needsharebutton.js') %}[m
   {% if theme.vendors.needmoreshare2_js %}[m
     {% set needmoreshare2_js = theme.vendors.needmoreshare2_js %}[m
[1mdiff --git a/themes/next/layout/_third-party/scroll-cookie.swig b/themes/next/layout/_third-party/scroll-cookie.swig[m
[1mindex 9fbb0eb..b4d9d07 100644[m
[1m--- a/themes/next/layout/_third-party/scroll-cookie.swig[m
[1m+++ b/themes/next/layout/_third-party/scroll-cookie.swig[m
[36m@@ -1,4 +1,4 @@[m
 {% if theme.save_scroll %}[m
[31m-  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/js.cookie.js?v={{ theme.version }}"></script>[m
[31m-  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/scroll-cookie.js?v={{ theme.version }}"></script>[m
[32m+[m[32m  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/js.cookie.js?v={{ version }}"></script>[m
[32m+[m[32m  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/scroll-cookie.js?v={{ version }}"></script>[m
 {% endif %}[m
[1mdiff --git a/themes/next/layout/_third-party/search/algolia-search/assets.swig b/themes/next/layout/_third-party/search/algolia-search/assets.swig[m
[1mindex 069504f..07e3222 100644[m
[1m--- a/themes/next/layout/_third-party/search/algolia-search/assets.swig[m
[1m+++ b/themes/next/layout/_third-party/search/algolia-search/assets.swig[m
[36m@@ -14,5 +14,5 @@[m
   <script src="{{ algolia_instant_js }}"></script>[m
   {# E: Include Algolia instantsearch.js library #}[m
 [m
[31m-  <script src="{{ url_for(theme.js) }}/src/algolia-search.js?v={{ theme.version }}"></script>[m
[32m+[m[32m  <script src="{{ url_for(theme.js) }}/src/algolia-search.js?v={{ version }}"></script>[m
 {% endif %}[m
[1mdiff --git a/themes/next/layout/_third-party/search/localsearch.swig b/themes/next/layout/_third-party/search/localsearch.swig[m
[1mindex c373e5c..7ec22de 100644[m
[1m--- a/themes/next/layout/_third-party/search/localsearch.swig[m
[1m+++ b/themes/next/layout/_third-party/search/localsearch.swig[m
[36m@@ -48,6 +48,21 @@[m
         .css('overflow', 'hidden');[m
       $("#search-loading-icon").css('margin', '20% auto 0 auto').css('text-align', 'center');[m
 [m
[32m+[m[32m      {% if theme.local_search.unescape %}[m
[32m+[m[32m        // ref: https://github.com/ForbesLindesay/unescape-html[m
[32m+[m[32m        var unescapeHtml = function(html) {[m
[32m+[m[32m          return String(html)[m
[32m+[m[32m            .replace(/&quot;/g, '"')[m
[32m+[m[32m            .replace(/&#39;/g, '\'')[m
[32m+[m[32m            .replace(/&#x3A;/g, ':')[m
[32m+[m[32m            // replace all the other &#x; chars[m
[32m+[m[32m            .replace(/&#(\d+);/g, function (m, p) { return String.fromCharCode(p); })[m
[32m+[m[32m            .replace(/&lt;/g, '<')[m
[32m+[m[32m            .replace(/&gt;/g, '>')[m
[32m+[m[32m            .replace(/&amp;/g, '&');[m
[32m+[m[32m        };[m
[32m+[m[32m      {% endif %}[m
[32m+[m
       $.ajax({[m
         url: path,[m
         dataType: isXml ? "xml" : "json",[m
[36m@@ -81,6 +96,9 @@[m
                 var title = data.title.trim();[m
                 var titleInLowerCase = title.toLowerCase();[m
                 var content = data.content.trim().replace(/<[^>]+>/g,"");[m
[32m+[m[32m                {% if theme.local_search.unescape %}[m
[32m+[m[32m                content = unescapeHtml(content);[m
[32m+[m[32m                {% endif %}[m
                 var contentInLowerCase = content.toLowerCase();[m
                 var articleUrl = decodeURIComponent(data.url);[m
                 var indexOfTitle = [];[m
[1mdiff --git a/themes/next/layout/archive.swig b/themes/next/layout/archive.swig[m
[1mindex 970491f..fc146b6 100644[m
[1m--- a/themes/next/layout/archive.swig[m
[1m+++ b/themes/next/layout/archive.swig[m
[36m@@ -2,7 +2,7 @@[m
 {% import '_macro/post-collapse.swig' as post_template %}[m
 {% import '_macro/sidebar.swig' as sidebar_template %}[m
 [m
[31m-{% block title %}{{ __('title.archive') }} | {{ config.title }}{% endblock %}[m
[32m+[m[32m{% block title %}{{ __('title.archive') }} | {{ title }}{% endblock %}[m
 [m
 {% block page_class %}page-archive{% endblock %}[m
 [m
[36m@@ -15,6 +15,7 @@[m
     <div id="posts" class="posts-collapse">[m
       <span class="archive-move-on"></span>[m
 [m
[32m+[m[32m      {% if theme.cheers_enabled %}[m
       <span class="archive-page-counter">[m
         {% set cheers %}[m
         {% set posts_length = site.posts.length %}[m
[36m@@ -28,6 +29,7 @@[m
         {% endif %}[m
         {{ __('cheers.' + cheers) }}! {{ _p("counter.archive_posts", site.posts.length) }} {{ __('keep_on') }}[m
       </span>[m
[32m+[m[32m      {% endif %}[m
 [m
       {% for post in page.posts %}[m
 [m
[1mdiff --git a/themes/next/layout/category.swig b/themes/next/layout/category.swig[m
[1mindex 8e3aa72..e28bdbc 100644[m
[1m--- a/themes/next/layout/category.swig[m
[1m+++ b/themes/next/layout/category.swig[m
[36m@@ -2,7 +2,7 @@[m
 {% import '_macro/post-collapse.swig' as post_template %}[m
 {% import '_macro/sidebar.swig' as sidebar_template %}[m
 [m
[31m-{% block title %}{{ __('title.category') }}: {{ page.category }} | {{ config.title }}{% endblock %}[m
[32m+[m[32m{% block title %}{{ __('title.category') }}: {{ page.category }} | {{ title }}{% endblock %}[m
 [m
 {% block content %}[m
 [m
[1mdiff --git a/themes/next/layout/index.swig b/themes/next/layout/index.swig[m
[1mindex 995c28a..26ecd8f 100644[m
[1m--- a/themes/next/layout/index.swig[m
[1m+++ b/themes/next/layout/index.swig[m
[36m@@ -2,7 +2,7 @@[m
 {% import '_macro/post.swig' as post_template %}[m
 {% import '_macro/sidebar.swig' as sidebar_template %}[m
 [m
[31m-{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}[m
[32m+[m[32m{% block title %}{{ title }}{% if theme.index_with_subtitle and subtitle %} &mdash; {{ subtitle }}{% endif %}{% endblock %}[m
 [m
 {% block page_class %}[m
   {% if is_home() %}page-home{% endif -%}[m
[1mdiff --git a/themes/next/layout/page.swig b/themes/next/layout/page.swig[m
[1mindex 83ad7bd..be968fd 100644[m
[1m--- a/themes/next/layout/page.swig[m
[1m+++ b/themes/next/layout/page.swig[m
[36m@@ -2,7 +2,7 @@[m
 {% import '_macro/sidebar.swig' as sidebar_template %}[m
 [m
   {% block title %}{#[m
[31m-  #}{% set page_title_suffix = ' | ' + config.title %}{#[m
[32m+[m[32m  #}{% set page_title_suffix = ' | ' + title %}{#[m
 [m
   #}{% if page.type === "categories" and not page.title %}{#[m
     #}{{ __('title.category') + page_title_suffix }}{#[m
[36m@@ -31,7 +31,13 @@[m
         {% if page.type === "tags" %}[m
           <div class="tag-cloud">[m
             <div class="tag-cloud-title">[m
[31m-                {{ _p('counter.tag_cloud', site.tags.length) }}[m
[32m+[m[32m                {% set visibleTags = 0 %}[m
[32m+[m[32m                {% for tag in site.tags %}[m
[32m+[m[32m                  {% if tag.length %}[m
[32m+[m[32m                    {% set visibleTags += 1 %}[m
[32m+[m[32m                  {% endif %}[m
[32m+[m[32m                {% endfor %}[m
[32m+[m[32m                {{ _p('counter.tag_cloud', visibleTags) }}[m
             </div>[m
             <div class="tag-cloud-tags">[m
               {{ tagcloud({min_font: 12, max_font: 30, amount: 300, color: true, start_color: '#ccc', end_color: '#111'}) }}[m
[36m@@ -40,7 +46,13 @@[m
         {% elif page.type === 'categories' %}[m
           <div class="category-all-page">[m
             <div class="category-all-title">[m
[31m-                {{ _p('counter.categories', site.categories.length) }}[m
[32m+[m[32m                {% set visibleCategories = 0 %}[m
[32m+[m[32m                {% for cat in site.categories %}[m
[32m+[m[32m                  {% if cat.length %}[m
[32m+[m[32m                    {% set visibleCategories += 1 %}[m
[32m+[m[32m                  {% endif %}[m
[32m+[m[32m                {% endfor %}[m
[32m+[m[32m                {{ _p('counter.categories', visibleCategories) }}[m
             </div>[m
             <div class="category-all">[m
               {{ list_categories() }}[m
[36m@@ -54,6 +66,7 @@[m
       {### END PAGE BODY ###}[m
       {#####################}[m
     </div>[m
[32m+[m[32m    {% include '_partials/breadcrumb.swig' %}[m
     {######################}[m
     {### END PAGE BLOCK ###}[m
     {######################}[m
[1mdiff --git a/themes/next/layout/post.swig b/themes/next/layout/post.swig[m
[1mindex 8274630..ddfddde 100644[m
[1m--- a/themes/next/layout/post.swig[m
[1m+++ b/themes/next/layout/post.swig[m
[36m@@ -3,7 +3,7 @@[m
 {% import '_macro/sidebar.swig' as sidebar_template %}[m
 [m
 [m
[31m-{% block title %}{{ page.title }} | {{ config.title }}{% endblock %}[m
[32m+[m[32m{% block title %}{{ page.title }} | {{ title }}{% endblock %}[m
 [m
 {% block page_class %}page-post-detail{% endblock %}[m
 [m
[36m@@ -20,8 +20,6 @@[m
         {% include '_partials/share/baidushare.swig' %}[m
       {% elseif theme.add_this_id %}[m
         {% include '_partials/share/add-this.swig' %}[m
[31m-      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}[m
[31m-        {% include '_partials/share/duoshuo_share.swig' %}[m
       {% endif %}[m
     </div>[m
   </div>[m
[1mdiff --git a/themes/next/layout/schedule.swig b/themes/next/layout/schedule.swig[m
[1mindex 216dfea..e1d3c04 100644[m
[1m--- a/themes/next/layout/schedule.swig[m
[1m+++ b/themes/next/layout/schedule.swig[m
[36m@@ -1,7 +1,7 @@[m
 {% extends '_layout.swig' %}[m
 {% import '_macro/sidebar.swig' as sidebar_template %}[m
 [m
[31m-{% block title %}{{ __('title.schedule') }} | {{ config.title }}{% endblock %}[m
[32m+[m[32m{% block title %}{{ __('title.schedule') }} | {{ title }}{% endblock %}[m
 [m
 {% block page_class %}page-post-detail page-calendar{% endblock %}[m
 [m
[1mdiff --git a/themes/next/layout/tag.swig b/themes/next/layout/tag.swig[m
[1mindex e570ce8..7af5a77 100644[m
[1m--- a/themes/next/layout/tag.swig[m
[1m+++ b/themes/next/layout/tag.swig[m
[36m@@ -2,7 +2,7 @@[m
 {% import '_macro/post-collapse.swig' as post_template %}[m
 {% import '_macro/sidebar.swig' as sidebar_template %}[m
 [m
[31m-{% block title %}{{ __('title.tag') }}: {{ page.tag }} | {{ config.title }}{% endblock %}[m
[32m+[m[32m{% block title %}{{ __('title.tag') }}: {{ page.tag }} | {{ title }}{% endblock %}[m
 [m
 {% block content %}[m
 [m
[1mdiff --git a/themes/next/package.json b/themes/next/package.json[m
[1mindex 8de1090..dcd6888 100644[m
[1m--- a/themes/next/package.json[m
[1m+++ b/themes/next/package.json[m
[36m@@ -1,7 +1,7 @@[m
 {[m
   "name": "hexo-theme-next",[m
[31m-  "version": "5.1.4",[m
[31m-  "description": "Elegant theme for Hexo",[m
[32m+[m[32m  "version": "6.3.0",[m
[32m+[m[32m  "description": "Elegant and powerful theme for Hexo",[m
   "main": "index.js",[m
   "directories": {[m
     "test": "test"[m
[36m@@ -11,21 +11,19 @@[m
   },[m
   "repository": {[m
     "type": "git",[m
[31m-    "url": "git+https://github.com/iissnan/hexo-theme-next.git"[m
[32m+[m[32m    "url": "git+https://github.com/theme-next/hexo-theme-next.git"[m
   },[m
   "keywords": [[m
[31m-    "NexT",[m
[31m-    "Hexo"[m
[32m+[m[32m    "hexo",[m
[32m+[m[32m    "theme",[m
[32m+[m[32m    "next"[m
   ],[m
[31m-  "author": "iissnan <iissnan@gmail.com>",[m
[31m-  "maintainers": [[m
[31m-    "Ivan Nginx <ivan.nginx@gmail.com> (https://almostover.ru)"[m
[31m-    ],[m
[31m-  "license": "MIT",[m
[32m+[m[32m  "author": "NexT <support@theme-next.org> (https://theme-next.org)",[m
[32m+[m[32m  "license": "AGPL",[m
   "bugs": {[m
[31m-    "url": "https://github.com/iissnan/hexo-theme-next/issues"[m
[32m+[m[32m    "url": "https://github.com/theme-next/hexo-theme-next/issues"[m
   },[m
[31m-  "homepage": "https://theme-next.iissnan.com",[m
[32m+[m[32m  "homepage": "https://theme-next.org",[m
   "devDependencies": {[m
     "coffee-script": "^1.10.0",[m
     "gulp": "^3.9.0",[m
[1mdiff --git a/themes/next/scripts/merge-configs.js b/themes/next/scripts/merge-configs.js[m
[1mindex 10c1eb6..2c36f24 100644[m
[1m--- a/themes/next/scripts/merge-configs.js[m
[1m+++ b/themes/next/scripts/merge-configs.js[m
[36m@@ -1,30 +1,45 @@[m
 /* global hexo */[m
 [m
[32m+[m[32m'use strict';[m
[32m+[m
 var merge = require('./merge');[m
 [m
[31m-/**[m
[31m- * Merge configs in _data/next.yml into hexo.theme.config.[m
[31m- * Note: configs in _data/next.yml will override configs in hexo.theme.config.[m
[31m- */[m
[31m-hexo.on('generateBefore', function () {[m
[32m+[m[32mhexo.on('generateBefore', function() {[m
   if (hexo.locals.get) {[m
     var data = hexo.locals.get('data');[m
[31m-    if ( data && data.next ) {[m
[31m-      if ( data.next.override ) {[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Merge configs from _data/next.yml into hexo.theme.config.[m
[32m+[m[32m     * If `override`, configs in next.yml will rewrite configs in hexo.theme.config.[m
[32m+[m[32m     * If next.yml not exists, merge all `theme_config.*` into hexo.theme.config.[m
[32m+[m[32m     */[m
[32m+[m[32m    if (data && data.next) {[m
[32m+[m[32m      if (data.next.override) {[m
         hexo.theme.config = data.next;[m
       } else {[m
[32m+[m[32m        merge(hexo.config, data.next);[m
         merge(hexo.theme.config, data.next);[m
       }[m
[32m+[m[32m    } else {[m
[32m+[m[32m      merge(hexo.theme.config, hexo.config.theme_config);[m
     }[m
[31m-  }[m
[31m-});[m
 [m
[31m-hexo.on('generateAfter', function () {[m
[31m-  hexo.log.warn("===============================================================");[m
[31m-  hexo.log.warn("========================= ATTENTION! ==========================");[m
[31m-  hexo.log.warn("===============================================================");[m
[31m-  hexo.log.warn(" NexT repository is moving here: https://github.com/theme-next ");[m
[31m-  hexo.log.warn("===============================================================");[m
[31m-  hexo.log.warn(" It's rebase to v6.0.0 and future maintenance will resume there");[m
[31m-  hexo.log.warn("===============================================================");[m
[32m+[m[32m    // Custom languages support. Introduced in NexT v6.3.0.[m
[32m+[m[32m    if (data && data.languages) {[m
[32m+[m[32m      var lang = this.config.language;[m
[32m+[m[32m      var i18n = this.theme.i18n;[m
[32m+[m
[32m+[m[32m      var mergeLang = function(lang) {[m
[32m+[m[32m        i18n.set(lang, merge(i18n.get([lang]), data.languages[lang]));[m
[32m+[m[32m      };[m
[32m+[m
[32m+[m[32m      if (Array.isArray(lang)) {[m
[32m+[m[32m        for (var i = 0; i < lang.length; i++) {[m
[32m+[m[32m          mergeLang(lang[i]);[m
[32m+[m[32m        }[m
[32m+[m[32m      } else {[m
[32m+[m[32m        mergeLang(lang);[m
[32m+[m[32m      }[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
 });[m
[1mdiff --git a/themes/next/scripts/tags/button.js b/themes/next/scripts/tags/button.js[m
[1mindex dfc0962..19821cf 100644[m
[1m--- a/themes/next/scripts/tags/button.js[m
[1m+++ b/themes/next/scripts/tags/button.js[m
[36m@@ -1,6 +1,13 @@[m
[31m-/* global hexo */[m
[31m-// Usage: {% button /path/to/url/, text, icon [class], title %}[m
[31m-// Alias: {% btn /path/to/url/, text, icon [class], title %}[m
[32m+[m[32m/**[m
[32m+[m[32m * button.js | global hexo script.[m
[32m+[m[32m *[m
[32m+[m[32m * Usage:[m
[32m+[m[32m *[m
[32m+[m[32m * {% button /path/to/url/, text, icon [class], title %}[m
[32m+[m[32m * {% btn /path/to/url/, text, icon [class], title %}[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32m'use strict';[m
 [m
 function postButton(args) {[m
   args = args.join(' ').split(',');[m
[36m@@ -27,5 +34,5 @@[m [mfunction postButton(args) {[m
   return result.join('');[m
 }[m
 [m
[31m-hexo.extend.tag.register('button', postButton);[m
[31m-hexo.extend.tag.register('btn', postButton);[m
[32m+[m[32mhexo.extend.tag.register('button', postButton, { ends: false });[m
[32m+[m[32mhexo.extend.tag.register('btn', postButton, { ends: false });[m
[1mdiff --git a/themes/next/scripts/tags/center-quote.js b/themes/next/scripts/tags/center-quote.js[m
[1mindex 93c5258..f673c6e 100644[m
[1m--- a/themes/next/scripts/tags/center-quote.js[m
[1m+++ b/themes/next/scripts/tags/center-quote.js[m
[36m@@ -1,6 +1,13 @@[m
[31m-/* global hexo */[m
[31m-// Usage: {% centerquote %} Something {% endcenterquote %}[m
[31m-// Alias: {% cq %} Something {% endcq %}[m
[32m+[m[32m/**[m
[32m+[m[32m * center-quote.js | global hexo script.[m
[32m+[m[32m *[m
[32m+[m[32m * Usage:[m
[32m+[m[32m *[m
[32m+[m[32m * {% centerquote %}Something{% endcenterquote %}[m
[32m+[m[32m * {% cq %}Something{% endcq %}[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32m'use strict';[m
 [m
 function centerQuote (args, content) {[m
   return '<blockquote class="blockquote-center">' +[m
[1mdiff --git a/themes/next/scripts/tags/exturl.js b/themes/next/scripts/tags/exturl.js[m
[1mindex 901a9ce..a65385e 100644[m
[1m--- a/themes/next/scripts/tags/exturl.js[m
[1m+++ b/themes/next/scripts/tags/exturl.js[m
[36m@@ -1,6 +1,13 @@[m
[31m-/* global hexo */[m
[31m-// Usage: {% exturl text url "title" %}[m
[31m-// Alias: {% extlink text url "title" %}[m
[32m+[m[32m/**[m
[32m+[m[32m * exturl.js | global hexo script.[m
[32m+[m[32m *[m
[32m+[m[32m * Usage:[m
[32m+[m[32m *[m
[32m+[m[32m * {% exturl text url "title" %}[m
[32m+[m[32m * {% extlink text url "title" %}[m
[32m+[m[32m *[m
[32m+[m[32m * If title not defined, url will be used as title.[m
[32m+[m[32m */[m
 [m
 'use strict';[m
 [m
[36m@@ -38,11 +45,13 @@[m [mfunction extURL(args, content) {[m
   // Delete link URL and text from arguments[m
   args = args.slice(i + 1);[m
 [m
[31m-  // Check if the link should be open in a new window[m
[31m-  // and collect the last text as the link title[m
[32m+[m[32m  // If any arguments exists, collect the last text as the link title,[m
[32m+[m[32m  // if not, set title as url.[m
   if (args.length) {[m
     var shift = args[0];[m
     title = args.join(' ');[m
[32m+[m[32m  } else {[m
[32m+[m[32m    title = item;[m
   }[m
 [m
   var attrs = {[m
[36m@@ -51,7 +60,6 @@[m [mfunction extURL(args, content) {[m
     title: title[m
   };[m
 [m
[31m-  //console.log(url);[m
   return htmlTag('span', attrs, text.join(' '));[m
 }[m
 [m
[1mdiff --git a/themes/next/scripts/tags/full-image.js b/themes/next/scripts/tags/full-image.js[m
[1mindex d4e0e4f..028da92 100644[m
[1m--- a/themes/next/scripts/tags/full-image.js[m
[1m+++ b/themes/next/scripts/tags/full-image.js[m
[36m@@ -1,6 +1,13 @@[m
[31m-/* global hexo */[m
[31m-// Usage: {% fullimage /path/to/image, alt, title %}[m
[31m-// Alias: {% fi /path/to/image, alt, title %}[m
[32m+[m[32m/**[m
[32m+[m[32m * full-image.js | global hexo script.[m
[32m+[m[32m *[m
[32m+[m[32m * Usage:[m
[32m+[m[32m *[m
[32m+[m[32m * {% fullimage /path/to/image, alt, title %}[m
[32m+[m[32m * {% fi /path/to/image, alt, title %}[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32m'use strict';[m
 [m
 function fullImage(args) {[m
   args = args.join(' ').split(',');[m
[36m@@ -22,5 +29,5 @@[m [mfunction fullImage(args) {[m
   return image.join(' ');[m
 }[m
 [m
[31m-hexo.extend.tag.register('fullimage', fullImage);[m
[31m-hexo.extend.tag.register('fi', fullImage);[m
[32m+[m[32mhexo.extend.tag.register('fullimage', fullImage, { ends: false });[m
[32m+[m[32mhexo.extend.tag.register('fi', fullImage, { ends: false });[m
[1mdiff --git a/themes/next/scripts/tags/group-pictures.js b/themes/next/scripts/tags/group-pictures.js[m
[1mindex df7774b..8b511ec 100644[m
[1m--- a/themes/next/scripts/tags/group-pictures.js[m
[1m+++ b/themes/next/scripts/tags/group-pictures.js[m
[36m@@ -1,6 +1,16 @@[m
[31m-/* global hexo */[m
[31m-// Usage: {% grouppicture group-layout %}{% endgrouppicture %}[m
[31m-// Alias: {% gp group-layout %}{% endgp %}[m
[32m+[m[32m/**[m
[32m+[m[32m * group-pictures.js | global hexo script.[m
[32m+[m[32m *[m
[32m+[m[32m * Usage:[m
[32m+[m[32m *[m
[32m+[m[32m * {% grouppicture [group]-[layout] %}{% endgrouppicture %}[m
[32m+[m[32m * {% gp [group]-[layout] %}{% endgp %}[m
[32m+[m[32m *[m
[32m+[m[32m * [group]  : Total number of pictures to add in the group.[m
[32m+[m[32m * [layout] : Default picture under the group to show.[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32m'use strict';[m
 [m
 function groupPicture(args, content) {[m
   args = args[0].split('-');[m
[1mdiff --git a/themes/next/scripts/tags/label.js b/themes/next/scripts/tags/label.js[m
[1mindex 57e54dd..867096d 100644[m
[1m--- a/themes/next/scripts/tags/label.js[m
[1m+++ b/themes/next/scripts/tags/label.js[m
[36m@@ -9,6 +9,8 @@[m
  *           If not defined, default class will be selected.[m
  */[m
 [m
[32m+[m[32m'use strict';[m
[32m+[m
 function postLabel (args) {[m
   args = args.join(' ').split('@');[m
   var classes = args[0] || 'default';[m
[1mdiff --git a/themes/next/scripts/tags/lazy-image.js b/themes/next/scripts/tags/lazy-image.js[m
[1mindex 650d57a..e0fbafe 100644[m
[1m--- a/themes/next/scripts/tags/lazy-image.js[m
[1m+++ b/themes/next/scripts/tags/lazy-image.js[m
[36m@@ -1,6 +1,13 @@[m
[31m-/* global hexo */[m
[31m-// Usage: {% lazyimage /path/to/image, alt, title %}[m
[31m-// Alias: {% li /path/to/image, alt, title %}[m
[32m+[m[32m/**[m
[32m+[m[32m * lazy-image.js | global hexo script.[m
[32m+[m[32m *[m
[32m+[m[32m * Usage:[m
[32m+[m[32m *[m
[32m+[m[32m * {% lazyimage /path/to/image, alt, title %}[m
[32m+[m[32m * {% li /path/to/image, alt, title %}[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32m'use strict';[m
 [m
 function lazyImage(args) {[m
   args = args.join(' ').split(',');[m
[36m@@ -22,5 +29,5 @@[m [mfunction lazyImage(args) {[m
   return image.join(' ');[m
 }[m
 [m
[31m-hexo.extend.tag.register('lazyimage', lazyImage);[m
[31m-hexo.extend.tag.register('li', lazyImage);[m
[32m+[m[32mhexo.extend.tag.register('lazyimage', lazyImage, { ends: false });[m
[32m+[m[32mhexo.extend.tag.register('li', lazyImage, { ends: false });[m
[1mdiff --git a/themes/next/scripts/tags/note.js b/themes/next/scripts/tags/note.js[m
[1mindex a5690a3..542de34 100644[m
[1m--- a/themes/next/scripts/tags/note.js[m
[1m+++ b/themes/next/scripts/tags/note.js[m
[36m@@ -13,6 +13,8 @@[m
  *           May be not defined.[m
  */[m
 [m
[32m+[m[32m'use strict';[m
[32m+[m
 function bscallOut (args, content) {[m
   return '<div class="note ' + args.join(' ') + '">' + hexo.render.renderSync({text: content, engine: 'markdown'}).trim() + '</div>';[m
 }[m
[1mdiff --git a/themes/next/source/css/_common/components/footer/footer.styl b/themes/next/source/css/_common/components/footer/footer.styl[m
[1mindex af7ce8c..4c40388 100644[m
[1m--- a/themes/next/source/css/_common/components/footer/footer.styl[m
[1m+++ b/themes/next/source/css/_common/components/footer/footer.styl[m
[36m@@ -7,9 +7,23 @@[m
 [m
 .footer-inner { text-align: center; }[m
 [m
[32m+[m[32m@keyframes iconAnimate {[m
[32m+[m[32m    0%,100%{transform:scale(1);}[m
[32m+[m[32m    10%,30%{transform:scale(0.9);}[m
[32m+[m[32m    20%,40%,60%,80%{transform:scale(1.1);}[m
[32m+[m[32m    50%,70%{transform:scale(1.1);}[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mif hexo-config('footer.icon.animated') {[m
[32m+[m	[32m#animate {[m
[32m+[m[32m    animation: iconAnimate 1.33s ease-in-out infinite;[m
[32m+[m	[32m}[m
[32m+[m[32m}[m
[32m+[m
 .with-love {[m
   display: inline-block;[m
   margin: 0 5px;[m
[32m+[m[32m  color: unquote(hexo-config('footer.icon.color'));[m
 }[m
 [m
 .powered-by,[m
[1mdiff --git a/themes/next/source/css/_common/components/header/header.styl b/themes/next/source/css/_common/components/header/header.styl[m
[1mindex 01f7f8a..0240caa 100644[m
[1m--- a/themes/next/source/css/_common/components/header/header.styl[m
[1m+++ b/themes/next/source/css/_common/components/header/header.styl[m
[36m@@ -2,8 +2,8 @@[m
 [m
 .header-inner { position: relative; }[m
 [m
[31m-[m
 @import "headerband";[m
 @import "site-meta";[m
 @import "site-nav";[m
 @import "menu";[m
[32m+[m[32m@import "github-banner" if hexo-config('github_banner');[m
[1mdiff --git a/themes/next/source/css/_common/components/highlight/highlight.styl b/themes/next/source/css/_common/components/highlight/highlight.styl[m
[1mindex 6b540fd..9b52eb9 100644[m
[1m--- a/themes/next/source/css/_common/components/highlight/highlight.styl[m
[1m+++ b/themes/next/source/css/_common/components/highlight/highlight.styl[m
[36m@@ -22,13 +22,12 @@[m [mcode {[m
   color: $code-foreground;[m
   background: $code-background;[m
   border-radius: $code-border-radius;[m
[31m-  font-size $code-font-size;[m
[32m+[m[32m  font-size: $code-font-size;[m
 }[m
 [m
 pre {[m
   @extend $code-block;[m
   padding: 10px;[m
[31m-[m
   code {[m
     padding: 0;[m
     color: $highlight-foreground;[m
[36m@@ -39,7 +38,9 @@[m [mpre {[m
 [m
 .highlight {[m
   @extend $code-block;[m
[31m-  border-radius: 1px[m
[32m+[m[32m  // Read values from NexT config and set they as local variables to use as string variables (in any CSS section).[m[41m [m
[32m+[m[32m  hexo-config('codeblock.border_radius') is a 'unit' ? (cbradius = unit(hexo-config('codeblock.border_radius'), px)) : (cbradius = 1px)[m[41m [m
[32m+[m[32m  border-radius: cbradius;[m
 [m
   pre {[m
     border: none;[m
[36m@@ -64,6 +65,10 @@[m [mpre {[m
     color: $highlight-foreground;[m
     line-height: 1em;[m
     margin-bottom: 1em;[m
[32m+[m[32m    margin: 0em;[m
[32m+[m[32m    padding: 0.5em;[m
[32m+[m[32m    background: $code-background;[m
[32m+[m[32m    border-bottom: 1px solid #e9e9e9;[m
 [m
     a {[m
       float: right;[m
[1mdiff --git a/themes/next/source/css/_common/components/pages/pages.styl b/themes/next/source/css/_common/components/pages/pages.styl[m
[1mindex cb14d04..1cffd07 100644[m
[1m--- a/themes/next/source/css/_common/components/pages/pages.styl[m
[1m+++ b/themes/next/source/css/_common/components/pages/pages.styl[m
[36m@@ -4,3 +4,4 @@[m
 @import "categories";[m
 @import "schedule";[m
 @import "post-detail";[m
[32m+[m[32m@import "breadcrumb";[m
[1mdiff --git a/themes/next/source/css/_common/components/post/post-expand.styl b/themes/next/source/css/_common/components/post/post-expand.styl[m
[1mindex 8c6d8a5..6225408 100644[m
[1m--- a/themes/next/source/css/_common/components/post/post-expand.styl[m
[1m+++ b/themes/next/source/css/_common/components/post/post-expand.styl[m
[36m@@ -62,3 +62,4 @@[m
 }[m
 [m
 .posts-expand .post-body .fancybox img { margin: 0 auto 25px; }[m
[32m+[m[32m.posts-expand .post-body img { margin: 0 auto 25px; }[m
\ No newline at end of file[m
[1mdiff --git a/themes/next/source/css/_common/components/post/post-meta.styl b/themes/next/source/css/_common/components/post/post-meta.styl[m
[1mindex d715203..1dc44a9 100644[m
[1m--- a/themes/next/source/css/_common/components/post/post-meta.styl[m
[1m+++ b/themes/next/source/css/_common/components/post/post-meta.styl[m
[36m@@ -11,15 +11,20 @@[m
     padding: 3px;[m
   }[m
   .post-category-list-link { color: $grey-dark; }[m
[31m-  [m
[32m+[m
   .post-description {[m
     font-size: 14px;[m
     margin-top: 2px;[m
   }[m
[32m+[m
[32m+[m[32m  time {[m
[32m+[m[32m    border-bottom: 1px dashed $grey-dark;[m
[32m+[m[32m    cursor: help;[m
[32m+[m[32m  }[m
 }[m
 [m
[31m-.post-wordcount {[m
[31m-  if !hexo-config('post_wordcount.separated_meta') { display: inline-block; }[m
[32m+[m[32m.post-symbolscount {[m
[32m+[m[32m  if !hexo-config('symbols_count_time.separated_meta') { display: inline-block; }[m
 }[m
 [m
 .post-meta-divider {[m
[36m@@ -43,7 +48,3 @@[m
     display: none;[m
   }[m
 }[m
[31m-[m
[31m-.posts-expand .post-comments-count {[m
[31m-  +mobile() { display: none; }[m
[31m-}[m
[1mdiff --git a/themes/next/source/css/_common/components/post/post-reward.styl b/themes/next/source/css/_common/components/post/post-reward.styl[m
[1mindex d171370..450a104 100644[m
[1m--- a/themes/next/source/css/_common/components/post/post-reward.styl[m
[1m+++ b/themes/next/source/css/_common/components/post/post-reward.styl[m
[36m@@ -39,16 +39,16 @@[m
     display: inline-block;[m
     margin: 0.8em 2em 0 2em;[m
 }[m
[31m-//#wechat:hover p{[m
[31m-//    animation: roll 0.1s infinite linear;[m
[31m-//    -webkit-animation: roll 0.1s infinite linear;[m
[31m-//    -moz-animation: roll 0.1s infinite linear;[m
[31m-//}[m
[31m-//#alipay:hover p{[m
[31m-//    animation: roll 0.1s infinite linear;[m
[31m-//    -webkit-animation: roll 0.1s infinite linear;[m
[31m-//    -moz-animation: roll 0.1s infinite linear;[m
[31m-//}[m
[32m+[m[32m#wechat:hover p{[m
[32m+[m[32m    animation: roll 0.1s infinite linear;[m
[32m+[m[32m    -webkit-animation: roll 0.1s infinite linear;[m
[32m+[m[32m    -moz-animation: roll 0.1s infinite linear;[m
[32m+[m[32m}[m
[32m+[m[32m#alipay:hover p{[m
[32m+[m[32m    animation: roll 0.1s infinite linear;[m
[32m+[m[32m    -webkit-animation: roll 0.1s infinite linear;[m
[32m+[m[32m    -moz-animation: roll 0.1s infinite linear;[m
[32m+[m[32m}[m
 #bitcoin:hover p {[m
     animation: roll 0.1s infinite linear;[m
     -webkit-animation: roll 0.1s infinite linear;[m
[1mdiff --git a/themes/next/source/css/_common/components/post/post-title.styl b/themes/next/source/css/_common/components/post/post-title.styl[m
[1mindex dcd1c06..80542dc 100644[m
[1m--- a/themes/next/source/css/_common/components/post/post-title.styl[m
[1m+++ b/themes/next/source/css/_common/components/post/post-title.styl[m
[36m@@ -1,8 +1,26 @@[m
 .posts-expand .post-title {[m
   text-align: center;[m
   word-break: break-word;[m
[31m-  font-weight: $posts-expand-title-font-weight[m
[32m+[m[32m  font-weight: $posts-expand-title-font-weight;[m
[32m+[m
[32m+[m[32m  if hexo-config('post_edit.enable') {[m
[32m+[m[32m    .post-edit-link {[m
[32m+[m[32m      color: #bbb;[m
[32m+[m[32m      display: inline-block;[m
[32m+[m[32m      float: right;[m
[32m+[m[32m      border-bottom: none;[m
[32m+[m[32m      the-transition-ease-in();[m
[32m+[m[32m      margin-left: -1.2em;[m
[32m+[m[32m      +mobile-small() {[m
[32m+[m[32m        margin-left: initial;[m
[32m+[m[32m      }[m
[32m+[m[32m      &:hover {[m
[32m+[m[32m        color: black;[m
[32m+[m[32m      }[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
 }[m
[32m+[m
 .posts-expand .post-title-link {[m
   display: inline-block;[m
   position: relative;[m
[1mdiff --git a/themes/next/source/css/_common/components/post/post.styl b/themes/next/source/css/_common/components/post/post.styl[m
[1mindex 03e44e9..9ca7c9b 100644[m
[1m--- a/themes/next/source/css/_common/components/post/post.styl[m
[1m+++ b/themes/next/source/css/_common/components/post/post.styl[m
[36m@@ -44,17 +44,6 @@[m
   if hexo-config('motion.transition.coll_header') { .collection-title { opacity: 0; } }[m
 }[m
 [m
[31m-.post-body p a{[m
[31m-  color: #0593d3;[m
[31m-  border-bottom: none;[m
[31m-[m
[31m-  &:hover {[m
[31m-    color: #fc6423;[m
[31m-    border-bottom: none;[m
[31m-    border-bottom: 1px solid #fc6423;[m
[31m-  }[m
[31m-}[m
[31m-[m
 @import "post-expand";[m
 @import "post-collapse";[m
 @import "post-type";[m
[36m@@ -69,4 +58,4 @@[m
 @import "post-copyright" if hexo-config('post_copyright.enable');[m
 @import "post-widgets" if (hexo-config('facebook_sdk.enable') and hexo-config('facebook_sdk.like_button')) or (hexo-config('vkontakte_api.enable') and hexo-config('vkontakte_api.like')) or hexo-config('rating.enable') or (hexo-config('needmoreshare2.enable') and hexo-config('needmoreshare2.postbottom.enable'));[m
 @import "post-rtl";[m
[31m-@import "my-post-copyright";[m
[32m+[m[32m@import "post-reading_progress" if hexo-config('reading_progress.enable');[m
[1mdiff --git a/themes/next/source/css/_common/components/sidebar/sidebar-author-links.styl b/themes/next/source/css/_common/components/sidebar/sidebar-author-links.styl[m
[1mindex 227e839..9413de9 100644[m
[1m--- a/themes/next/source/css/_common/components/sidebar/sidebar-author-links.styl[m
[1m+++ b/themes/next/source/css/_common/components/sidebar/sidebar-author-links.styl[m
[36m@@ -2,13 +2,15 @@[m
   margin-top: 20px;[m
 }[m
 [m
[31m-.links-of-author a {[m
[32m+[m[32m.links-of-author a,[m
[32m+[m[32m.links-of-author .exturl {[m
   display: inline-block;[m
   vertical-align: middle;[m
   margin-right: 10px;[m
   margin-bottom: 10px;[m
   border-bottom-color: $black-light;[m
   font-size: 13px;[m
[32m+[m[32m  if hexo-config('social_icons.transition') { the-transition(); }[m
 [m
   &:before {[m
     display: inline-block;[m
[1mdiff --git a/themes/next/source/css/_common/components/sidebar/sidebar-author.styl b/themes/next/source/css/_common/components/sidebar/sidebar-author.styl[m
[1mindex 14ac717..2da119c 100644[m
[1m--- a/themes/next/source/css/_common/components/sidebar/sidebar-author.styl[m
[1m+++ b/themes/next/source/css/_common/components/sidebar/sidebar-author.styl[m
[36m@@ -5,6 +5,29 @@[m
   max-width: $site-author-image-width;[m
   height: $site-author-image-height;[m
   border: $site-author-image-border-width solid $site-author-image-border-color;[m
[32m+[m[32m  opacity: hexo-config('avatar.opacity') is a 'unit' ? hexo-config('avatar.opacity') : 1;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mif hexo-config('avatar.rounded') {[m
[32m+[m[32m.site-author-image {[m
[32m+[m[32m  border-radius: 100%;[m
[32m+[m[32m}[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mif hexo-config('avatar.rotated') {[m
[32m+[m[32m.site-author-image {[m
[32m+[m[32m  -webkit-transition: -webkit-transform 1.0s ease-out;[m
[32m+[m[32m  -moz-transition: -moz-transform 1.0s ease-out;[m
[32m+[m[32m  -ms-transition: -ms-transform 1.0s ease-out;[m
[32m+[m[32m  transition: transform 1.0s ease-out;[m
[32m+[m[32m}[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mimg:hover {[m
[32m+[m[32m  -webkit-transform: rotateZ(360deg);[m
[32m+[m[32m  -moz-transform: rotateZ(360deg);[m
[32m+[m[32m  -ms-transform: rotate(360deg);[m
[32m+[m[32m  transform: rotateZ(360deg);[m
 }[m
 [m
 .site-author-name {[m
[1mdiff --git a/themes/next/source/css/_common/components/sidebar/sidebar-toc.styl b/themes/next/source/css/_common/components/sidebar/sidebar-toc.styl[m
[1mindex 27e15f0..b9f0264 100644[m
[1m--- a/themes/next/source/css/_common/components/sidebar/sidebar-toc.styl[m
[1m+++ b/themes/next/source/css/_common/components/sidebar/sidebar-toc.styl[m
[36m@@ -33,7 +33,7 @@[m
 .post-toc .nav-item {[m
   overflow: hidden;[m
   text-overflow: ellipsis;[m
[31m-  text-align: justify;[m
[32m+[m[32m  //text-align: justify;[m
   white-space: nowrap if !hexo-config('toc.wrap');[m
   line-height: 1.8;[m
 }[m
[1mdiff --git a/themes/next/source/css/_common/components/sidebar/sidebar.styl b/themes/next/source/css/_common/components/sidebar/sidebar.styl[m
[1mindex 635cc94..555668a 100644[m
[1m--- a/themes/next/source/css/_common/components/sidebar/sidebar.styl[m
[1m+++ b/themes/next/source/css/_common/components/sidebar/sidebar.styl[m
[36m@@ -10,7 +10,7 @@[m
   background: $black-deep;[m
   -webkit-transform: translateZ(0); // http://stackoverflow.com/questions/17079857/position-fixed-broken-in-chrome-with-flash-behind[m
 [m
[31m-  a {[m
[32m+[m[32m  a, .exturl {[m
     color: $grey-dark;[m
     border-bottom-color: $black-light;[m
     &:hover { color: $gainsboro; }[m
[1mdiff --git a/themes/next/source/css/_common/components/tags/full-image.styl b/themes/next/source/css/_common/components/tags/full-image.styl[m
[1mindex 11ae578..90426d0 100644[m
[1m--- a/themes/next/source/css/_common/components/tags/full-image.styl[m
[1m+++ b/themes/next/source/css/_common/components/tags/full-image.styl[m
[36m@@ -4,9 +4,9 @@[m
   max-width: 100%;[m
   width: auto;[m
   margin: 20px auto 25px;[m
[31m-  +desktop() {[m
[31m-    max-width: none;[m
[31m-    width: $full-image-width;[m
[31m-    margin: $full-image-margin-vertical $full-image-margin-horizontal;[m
[31m-  }[m
[32m+[m[32m//  +desktop() {[m
[32m+[m[32m//    max-width: none;[m
[32m+[m[32m//    width: $full-image-width;[m
[32m+[m[32m//    margin: $full-image-margin-vertical $full-image-margin-horizontal;[m
[32m+[m[32m//  }[m
 }[m
[1mdiff --git a/themes/next/source/css/_common/components/third-party/algolia-search.styl b/themes/next/source/css/_common/components/third-party/algolia-search.styl[m
[1mindex e2e9828..652ba1a 100644[m
[1m--- a/themes/next/source/css/_common/components/third-party/algolia-search.styl[m
[1m+++ b/themes/next/source/css/_common/components/third-party/algolia-search.styl[m
[36m@@ -1,3 +1,11 @@[m
[32m+[m[32m// fix bug using algolia search's CDN[m
[32m+[m[32m.ais-search-box--magnifier svg {[m
[32m+[m[32m    display: none !important;[m
[32m+[m[32m}[m
[32m+[m[32m.ais-search-box--reset svg {[m
[32m+[m[32m    display: none !important;[m
[32m+[m[32m}[m
[32m+[m
 .algolia-pop-overlay[m
   position: fixed[m
   width: 100%[m
[36m@@ -6,6 +14,8 @@[m
   left: 0[m
   z-index: 2080[m
   background-color: rgba(0, 0, 0, 0.3)[m
[32m+[m[32m  +mobile()[m
[32m+[m[32m    display: none;[m
 [m
 .algolia-popup[m
   overflow: hidden[m
[1mdiff --git a/themes/next/source/css/_common/components/third-party/third-party.styl b/themes/next/source/css/_common/components/third-party/third-party.styl[m
[1mindex c2298d0..0896976 100644[m
[1m--- a/themes/next/source/css/_common/components/third-party/third-party.styl[m
[1m+++ b/themes/next/source/css/_common/components/third-party/third-party.styl[m
[36m@@ -1,4 +1,3 @@[m
[31m-@import "duoshuo";[m
 @import "gitment" if hexo-config('gitment.enable');[m
 @import "jiathis";[m
 @import "han";[m
[36m@@ -7,3 +6,4 @@[m
 @import "busuanzi-counter";[m
 @import "algolia-search" if hexo-config('algolia_search.enable');[m
 @import "needsharebutton" if hexo-config('needmoreshare2.enable');[m
[32m+[m[32m@import "related-posts" if hexo-config('related_posts.enable');[m
[1mdiff --git a/themes/next/source/css/_common/scaffolding/base.styl b/themes/next/source/css/_common/scaffolding/base.styl[m
[1mindex 74c77e3..3781826 100644[m
[1m--- a/themes/next/source/css/_common/scaffolding/base.styl[m
[1m+++ b/themes/next/source/css/_common/scaffolding/base.styl[m
[36m@@ -25,7 +25,7 @@[m [mh1, h2, h3, h4, h5, h6 {[m
   font-family: $font-family-headings;[m
 }[m
 [m
[31m-h2, h3, h4, h5, h6 { margin: 20px 0 15px; }[m
[32m+[m[32mh1, h2, h3, h4, h5, h6 { margin: 20px 0 15px; }[m
 [m
 for headline in (1..6) {[m
   h{headline} {[m
[1mdiff --git a/themes/next/source/css/_common/scaffolding/tables.styl b/themes/next/source/css/_common/scaffolding/tables.styl[m
[1mindex c653b81..03fdd6e 100644[m
[1m--- a/themes/next/source/css/_common/scaffolding/tables.styl[m
[1m+++ b/themes/next/source/css/_common/scaffolding/tables.styl[m
[36m@@ -5,7 +5,6 @@[m [mtable {[m
   border-spacing: 0;[m
   border: 1px solid $table-border-color;[m
   font-size: $table-font-size;[m
[31m-  table-layout: fixed;[m
   word-wrap: break-all;[m
 }[m
 table>tbody>tr {[m
[1mdiff --git a/themes/next/source/css/_mixins/Pisces.styl b/themes/next/source/css/_mixins/Pisces.styl[m
[1mindex 34543b1..f44810c 100644[m
[1m--- a/themes/next/source/css/_mixins/Pisces.styl[m
[1m+++ b/themes/next/source/css/_mixins/Pisces.styl[m
[36m@@ -2,7 +2,7 @@[m [msidebar-inline-links-item() {[m
   margin: 5px 0 0;[m
   if !hexo-config('social_icons.icons_only') { width: 50%; }[m
 [m
[31m-  & a {[m
[32m+[m[32m  & a, .exturl {[m
     max-width: 216px;[m
     box-sizing: border-box;[m
     display: inline-block;[m
[36m@@ -12,6 +12,5 @@[m [msidebar-inline-links-item() {[m
     overflow: hidden;[m
     white-space: nowrap;[m
     text-overflow: ellipsis;[m
[31m-    if hexo-config('social_icons.transition') { the-transition(); }[m
   }[m
 }[m
[1mdiff --git a/themes/next/source/css/_mixins/base.styl b/themes/next/source/css/_mixins/base.styl[m
[1mindex 0e787f7..bd51319 100644[m
[1m--- a/themes/next/source/css/_mixins/base.styl[m
[1m+++ b/themes/next/source/css/_mixins/base.styl[m
[36m@@ -34,6 +34,12 @@[m [mmobile() {[m
   }[m
 }[m
 [m
[32m+[m[32mtablet-mobile() {[m
[32m+[m[32m  @media (max-width: 991px) {[m
[32m+[m[32m    {block}[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[32m+[m
 tablet() {[m
   @media (min-width: 768px) and (max-width: 991px) {[m
     {block}[m
[1mdiff --git a/themes/next/source/css/_schemes/Gemini/index.styl b/themes/next/source/css/_schemes/Gemini/index.styl[m
[1mindex 95dd34d..68e08ac 100644[m
[1m--- a/themes/next/source/css/_schemes/Gemini/index.styl[m
[1m+++ b/themes/next/source/css/_schemes/Gemini/index.styl[m
[36m@@ -1,6 +1,7 @@[m
 @import "../Pisces/_layout";[m
 @import "../Pisces/_brand";[m
 @import "../Pisces/_menu";[m
[32m+[m[32m@import "../Pisces/_sub-menu";[m
 @import "../Pisces/_sidebar";[m
 // Import _posts if want to justify text-align on mobile.[m
 //@import "../Pisces/_posts";[m
[36m@@ -22,6 +23,17 @@[m
 hexo-config('sidebar.offset') is a 'unit' ? (sboffset = unit(hexo-config('sidebar.offset'), px)) : (sboffset = 0)[m
 use_seo = hexo-config('seo');[m
 [m
[32m+[m[32m// Maximum content width.[m
[32m+[m[32m// =================================================[m
[32m+[m[32m$max-content-width = hexo-config('max_content_width')[m
[32m+[m[32mif $max-content-width {[m
[32m+[m[32m  .header,[m
[32m+[m[32m  .container .main-inner,[m
[32m+[m[32m  .footer-inner {[m
[32m+[m[32m    max-width: unquote($max-content-width);[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[32m+[m
 // =================================================[m
 // Desktop layout styles.[m
 // =================================================[m
[36m@@ -102,6 +114,25 @@[m [muse_seo = hexo-config('seo');[m
   bottom: auto;[m
 }[m
 [m
[32m+[m[32m// Sub-menu(s).[m
[32m+[m[32m.sub-menu {[m
[32m+[m[32m  border-bottom: initial !important;[m
[32m+[m[32m  box-shadow: $box-shadow-inner;[m
[32m+[m[32m  // Adapt submenu(s) with post-blocks.[m
[32m+[m[32m  &+ #content > #posts {[m
[32m+[m[32m    .post-block {[m
[32m+[m[32m      box-shadow: $box-shadow;[m
[32m+[m[32m      margin-top: sboffset;[m
[32m+[m[32m      +tablet() {[m
[32m+[m[32m        margin-top: $content-tablet-padding;[m
[32m+[m[32m      }[m
[32m+[m[32m      +mobile() {[m
[32m+[m[32m        margin-top: $content-mobile-padding;[m
[32m+[m[32m      }[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[32m+[m
 // =================================================[m
 // Headers.[m
 // =================================================[m
[1mdiff --git a/themes/next/source/css/_schemes/Mist/_base.styl b/themes/next/source/css/_schemes/Mist/_base.styl[m
[1mindex 97dc4cb..cf2f438 100644[m
[1m--- a/themes/next/source/css/_schemes/Mist/_base.styl[m
[1m+++ b/themes/next/source/css/_schemes/Mist/_base.styl[m
[36m@@ -1,8 +1,5 @@[m
 // Tags[m
 // --------------------------------------------------[m
[31m-h1, h2, h3, h4, h5, h6 { margin: 20px 0 10px; }[m
[31m-[m
[31m-p { margin: 0 0 25px 0; }[m
 [m
 a { border-bottom-color: $grey-light; }[m
 [m
[1mdiff --git a/themes/next/source/css/_schemes/Mist/_menu.styl b/themes/next/source/css/_schemes/Mist/_menu.styl[m
[1mindex fa0cd4e..bdf27a9 100644[m
[1m--- a/themes/next/source/css/_schemes/Mist/_menu.styl[m
[1m+++ b/themes/next/source/css/_schemes/Mist/_menu.styl[m
[36m@@ -5,9 +5,8 @@[m
   float: right;[m
 }[m
 [m
[31m-[m
 .menu {[m
[31m-  float: right;[m
[32m+[m[32m  //float: right;[m
   margin: 8px 0 0 0;[m
 [m
   +mobile() {[m
[36m@@ -20,11 +19,29 @@[m
   .menu-item {[m
     margin: 0;[m
     +mobile() { display: block; }[m
[32m+[m
[32m+[m[32m    .badge {[m
[32m+[m[32m      display: inline-block;[m
[32m+[m[32m      padding: 1px 4px;[m
[32m+[m[32m      margin-left: 5px;[m
[32m+[m[32m      font-weight: 700;[m
[32m+[m[32m      line-height: 1;[m
[32m+[m[32m      color: $black-light;[m
[32m+[m[32m      text-align: center;[m
[32m+[m[32m      white-space: nowrap;[m
[32m+[m[32m      background-color: #fff;[m
[32m+[m[32m      border-radius: 10px;[m
[32m+[m[32m      text-shadow: 1px 1px 0px rgba(0,0,0,0.1);[m
[32m+[m[32m      +mobile() {[m
[32m+[m[32m        float: right;[m
[32m+[m[32m        margin: 0.35em 0 0 0;[m
[32m+[m[32m      }[m
[32m+[m[32m    }[m
[32m+[m
   }[m
 [m
   .menu-item a {[m
     padding: 0 10px;[m
[31m-    background: none;[m
     border: none;[m
     border-radius: 2px;[m
     transition-property: background;[m
[36m@@ -44,3 +61,7 @@[m
 [m
   +mobile() { float: none; }[m
 }[m
[32m+[m
[32m+[m[32m.menu-item-active a {[m
[32m+[m[32m  @extend .menu .menu-item a:hover;[m
[32m+[m[32m}[m
[1mdiff --git a/themes/next/source/css/_schemes/Mist/_posts-expanded.styl b/themes/next/source/css/_schemes/Mist/_posts-expanded.styl[m
[1mindex 4ca1b29..af35e96 100644[m
[1m--- a/themes/next/source/css/_schemes/Mist/_posts-expanded.styl[m
[1m+++ b/themes/next/source/css/_schemes/Mist/_posts-expanded.styl[m
[36m@@ -28,7 +28,7 @@[m
   .post-title:hover:before { background: $black-deep; }[m
 [m
   .post-body {[m
[31m-    +mobile() { font-size: $font-size-small; }[m
[32m+[m[32m    +mobile() { font-size: $font-size-base; }[m
   }[m
 [m
   .post-body img { margin: 0; }[m
[1mdiff --git a/themes/next/source/css/_schemes/Mist/index.styl b/themes/next/source/css/_schemes/Mist/index.styl[m
[1mindex 7d047f4..bb2f4c5 100644[m
[1m--- a/themes/next/source/css/_schemes/Mist/index.styl[m
[1m+++ b/themes/next/source/css/_schemes/Mist/index.styl[m
[36m@@ -10,7 +10,8 @@[m
 @import "_search.styl";[m
 @import "_posts-expanded";[m
 @import "sidebar/sidebar-blogroll";[m
[31m-[m
[32m+[m[32m// Import _posts if want to justify text-align on mobile.[m
[32m+[m[32m// @import "../Pisces/_posts";[m
 [m
 // Components[m
 // --------------------------------------------------[m
[1mdiff --git a/themes/next/source/css/_schemes/Muse/_menu.styl b/themes/next/source/css/_schemes/Muse/_menu.styl[m
[1mindex b18fed9..16dbee1 100644[m
[1m--- a/themes/next/source/css/_schemes/Muse/_menu.styl[m
[1m+++ b/themes/next/source/css/_schemes/Muse/_menu.styl[m
[36m@@ -8,7 +8,7 @@[m
     padding: 0;[m
     background: white;[m
     border-bottom: 1px solid $gray-lighter;[m
[31m-    z-index: $zindex-5;[m
[32m+[m[32m    z-index: $zindex-3;[m
   }[m
 }[m
 [m
[36m@@ -22,12 +22,39 @@[m
     vertical-align: top;[m
   }[m
 [m
[32m+[m[32m  .badge {[m
[32m+[m[32m    display: inline-block;[m
[32m+[m[32m    padding: 1px 4px;[m
[32m+[m[32m    margin-left: 5px;[m
[32m+[m[32m    font-weight: 700;[m
[32m+[m[32m    line-height: 1;[m
[32m+[m[32m    text-align: center;[m
[32m+[m[32m    white-space: nowrap;[m
[32m+[m[32m    background-color: $gainsboro;[m
[32m+[m[32m    +mobile() {[m
[32m+[m[32m      float: right;[m
[32m+[m[32m      margin: 0.35em 0 0 0;[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m
   br {[m
     +mobile() { display: none; }[m
   }[m
 [m
   a {[m
[31m-    +mobile() { padding: 5px 10px; }[m
[32m+[m[32m    +mobile() {[m
[32m+[m[32m      padding: 5px 10px;[m
[32m+[m[32m      border-bottom-color: white !important;[m
[32m+[m[32m    }[m
   }[m
   .fa { margin-right: 0; }[m
 }[m
[32m+[m
[32m+[m[32m.menu-item-active a {[m
[32m+[m[32m  border-bottom-color: $menu-link-hover-border !important;[m
[32m+[m[32m  color: $black-deep;[m
[32m+[m
[32m+[m[32m  +mobile() {[m
[32m+[m[32m    border-bottom-color: white !important;[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[1mdiff --git a/themes/next/source/css/_schemes/Muse/index.styl b/themes/next/source/css/_schemes/Muse/index.styl[m
[1mindex 35effe8..2921064 100644[m
[1m--- a/themes/next/source/css/_schemes/Muse/index.styl[m
[1m+++ b/themes/next/source/css/_schemes/Muse/index.styl[m
[36m@@ -3,3 +3,5 @@[m
 @import "_menu.styl";[m
 @import "_search.styl";[m
 @import "sidebar/sidebar-blogroll";[m
[32m+[m[32m// Import _posts if want to justify text-align on mobile.[m
[32m+[m[32m// @import "../Pisces/_posts";[m
[1mdiff --git a/themes/next/source/css/_schemes/Pisces/_layout.styl b/themes/next/source/css/_schemes/Pisces/_layout.styl[m
[1mindex f7e5e0d..a3a2b52 100644[m
[1m--- a/themes/next/source/css/_schemes/Pisces/_layout.styl[m
[1m+++ b/themes/next/source/css/_schemes/Pisces/_layout.styl[m
[36m@@ -16,13 +16,13 @@[m
   top: 0;[m
   overflow: hidden;[m
   padding: 0;[m
[31m-  width: 240px;[m
[32m+[m[32m  width: $sidebar-desktop;[m
   background: white;[m
   box-shadow: $box-shadow-inner;[m
   border-radius: $border-radius-inner;[m
 [m
   +desktop-large() {[m
[31m-    .container & { width: 240px; }[m
[32m+[m[32m    .container & { width: $sidebar-desktop; }[m
   }[m
   +tablet() {[m
     position: relative;[m
[1mdiff --git a/themes/next/source/css/_schemes/Pisces/_menu.styl b/themes/next/source/css/_schemes/Pisces/_menu.styl[m
[1mindex 21986ac..e740c1c 100644[m
[1m--- a/themes/next/source/css/_schemes/Pisces/_menu.styl[m
[1m+++ b/themes/next/source/css/_schemes/Pisces/_menu.styl[m
[36m@@ -31,23 +31,43 @@[m
     }[m
   }[m
 [m
[32m+[m[32m  .badge {[m
[32m+[m[32m    display: inline-block;[m
[32m+[m[32m    padding: 2px 5px;[m
[32m+[m[32m    font-weight: 700;[m
[32m+[m[32m    line-height: 1;[m
[32m+[m[32m    color: #fff;[m
[32m+[m[32m    text-align: center;[m
[32m+[m[32m    white-space: nowrap;[m
[32m+[m[32m    vertical-align: middle;[m
[32m+[m[32m    background-color: $grey-light;[m
[32m+[m[32m    border-radius: 10px;[m
[32m+[m[32m    float: right;[m
[32m+[m[32m    margin: 0.35em 0 0 0;[m
[32m+[m[32m    text-shadow: 1px 1px 0px rgba(0,0,0,0.1);[m
[32m+[m[32m  }[m
[32m+[m
   br { display: none; }[m
 }[m
 [m
 .menu-item-active a {[m
   @extend .menu .menu-item a:hover;[m
 [m
[31m-  &:after {[m
[31m-    content: " ";[m
[31m-    position: absolute;[m
[31m-    top: 50%;[m
[31m-    margin-top: -3px;[m
[31m-    right: 15px;[m
[31m-    width: 6px;[m
[31m-    height: 6px;[m
[31m-    border-radius: 50%;[m
[31m-    background-color: $grey;[m
[32m+[m[32m  badges = hexo-config('menu_settings.badges');[m
[32m+[m[32m  if not badges {[m
[32m+[m[32m    &:after {[m
[32m+[m[32m      content: " ";[m
[32m+[m[32m      position: absolute;[m
[32m+[m[32m      top: 50%;[m
[32m+[m[32m      margin-top: -3px;[m
[32m+[m[32m      right: 15px;[m
[32m+[m[32m      width: 6px;[m
[32m+[m[32m      height: 6px;[m
[32m+[m[32m      border-radius: 50%;[m
[32m+[m[32m      background-color: $grey;[m
[32m+[m[32m    }[m
   }[m
[32m+[m
 }[m
 [m
 .btn-bar {[m
[1mdiff --git a/themes/next/source/css/_schemes/Pisces/_sidebar.styl b/themes/next/source/css/_schemes/Pisces/_sidebar.styl[m
[1mindex 9adfb55..9ced486 100644[m
[1m--- a/themes/next/source/css/_schemes/Pisces/_sidebar.styl[m
[1m+++ b/themes/next/source/css/_schemes/Pisces/_sidebar.styl[m
[36m@@ -14,7 +14,7 @@[m
 .sidebar-inner {[m
 //padding: 20px 10px 0;[m
   box-sizing: border-box;[m
[31m-  width: 240px;[m
[32m+[m[32m  width: $sidebar-desktop;[m
   color: $text-color;[m
   background: white;[m
   box-shadow: $box-shadow;[m
[36m@@ -41,7 +41,8 @@[m
   clearfix();[m
 }[m
 [m
[31m-.sidebar a {[m
[32m+[m[32m.sidebar a,[m
[32m+[m[32m.sidebar .exturl {[m
   color: $black-light;[m
 [m
   &:hover { color: $black-deep; }[m
[36m@@ -52,8 +53,8 @@[m
 }[m
 [m
 .links-of-author-item {[m
[31m-  a:before { display: none; }[m
[31m-  a {[m
[32m+[m[32m  a:before, .exturl:before { display: none; }[m
[32m+[m[32m  a, .exturl {[m
     border-bottom: none;[m
     text-decoration: underline;[m
   }[m
[36m@@ -83,11 +84,15 @@[m
   display: flex;[m
   flex-wrap: wrap;[m
   justify-content: center;[m
[32m+[m
[32m+[m[32m  .exturl {[m
[32m+[m[32m    font-size: 13px;[m
[32m+[m[32m  }[m
 }[m
 .links-of-author-item {[m
   sidebar-inline-links-item();[m
 [m
[31m-  a {[m
[32m+[m[32m  a, .exturl {[m
     display: block;[m
     text-decoration: none;[m
 [m
[1mdiff --git a/themes/next/source/css/_schemes/Pisces/index.styl b/themes/next/source/css/_schemes/Pisces/index.styl[m
[1mindex cda4936..0e3f37d 100644[m
[1m--- a/themes/next/source/css/_schemes/Pisces/index.styl[m
[1m+++ b/themes/next/source/css/_schemes/Pisces/index.styl[m
[36m@@ -1,5 +1,6 @@[m
 @import "_layout";[m
 @import "_brand";[m
 @import "_menu";[m
[32m+[m[32m@import "_sub-menu";[m
 @import "_sidebar";[m
 @import "_posts";[m
[1mdiff --git a/themes/next/source/css/_variables/Gemini.styl b/themes/next/source/css/_variables/Gemini.styl[m
[1mindex 4d6e7e0..04e14ef 100644[m
[1m--- a/themes/next/source/css/_variables/Gemini.styl[m
[1m+++ b/themes/next/source/css/_variables/Gemini.styl[m
[36m@@ -7,8 +7,9 @@[m
 // --------------------------------------------------[m
 $body-bg-color                    = #eee[m
 $main-desktop                     = 75%[m
[31m-$sidebar-desktop                  = 240px[m
[31m-$content-desktop                  = calc(100% - 252px)[m
[32m+[m[32m$sidebar-width                    = hexo-config('sidebar_width') is a 'unit' ? hexo-config('sidebar_width') : 240[m
[32m+[m[32m$sidebar-desktop                  = unit($sidebar-width, 'px')[m
[32m+[m[32m$content-desktop                  = 'calc(100% - %s)' % unit($sidebar-width + 12, 'px')[m
 [m
 // Borders.[m
 // --------------------------------------------------[m
[1mdiff --git a/themes/next/source/css/_variables/Pisces.styl b/themes/next/source/css/_variables/Pisces.styl[m
[1mindex 320aeb1..3abb409 100644[m
[1m--- a/themes/next/source/css/_variables/Pisces.styl[m
[1m+++ b/themes/next/source/css/_variables/Pisces.styl[m
[36m@@ -67,9 +67,9 @@[m [m$btn-default-hover-color      = white[m
 $btn-default-hover-bg         = $black-deep[m
 [m
 // Full Image Tag[m
[31m-$full-image-width             = 118%[m
[31m-$full-image-margin-horizontal = -9%[m
[31m-$full-image-margin-vertical   = 0[m
[32m+[m[32m//$full-image-width             = 118%[m
[32m+[m[32m//$full-image-margin-horizontal = -9%[m
[32m+[m[32m//$full-image-margin-vertical   = 0[m
 [m
 // Back to top[m
 $b2t-opacity                  = .6[m
[1mdiff --git a/themes/next/source/css/_variables/base.styl b/themes/next/source/css/_variables/base.styl[m
[1mindex fcd7830..0deda9c 100644[m
[1m--- a/themes/next/source/css/_variables/base.styl[m
[1m+++ b/themes/next/source/css/_variables/base.styl[m
[36m@@ -144,7 +144,7 @@[m [m$table-row-hover-bg-color       = $whitesmoke[m
 // Code & Code Blocks[m
 // --------------------------------------------------[m
 $code-font-family               = $font-family-monospace[m
[31m-$code-font-size                 = 13px[m
[32m+[m[32m$code-font-size                 = 14px[m
 $code-font-size                 = unit(hexo-config('font.codes.size'), px) if hexo-config('font.codes.size') is a 'unit'[m
 $code-border-radius             = 3px[m
 $code-foreground                = $black-light[m
[36m@@ -315,9 +315,9 @@[m [m$b2t-color                    = white[m
 $b2t-bg-color                 = $black-deep[m
 [m
 // full-image[m
[31m-$full-image-width             = 110%[m
[31m-$full-image-margin-horizontal = -5%[m
[31m-$full-image-margin-vertical   = 25px[m
[32m+[m[32m//$full-image-width             = 110%[m
[32m+[m[32m//$full-image-margin-horizontal = -5%[m
[32m+[m[32m//$full-image-margin-vertical   = 25px[m
 [m
 //  .post-expand .post-eof[m
 //  In Muse scheme, margin above and below the post separator[m
[1mdiff --git a/themes/next/source/css/main.styl b/themes/next/source/css/main.styl[m
[1mindex d46298d..fdb1360 100644[m
[1m--- a/themes/next/source/css/main.styl[m
[1m+++ b/themes/next/source/css/main.styl[m
[36m@@ -3,15 +3,20 @@[m
 [m
 [m
 $scheme    = hexo-config('scheme') ? hexo-config('scheme') : 'Muse';[m
[31m-$variables = base $scheme custom;[m
[31m-$mixins    = base $scheme custom;[m
[32m+[m
[32m+[m[32m$custom_styles = hexo-config('custom_file_path.styles') ? "../../../../../" + hexo-config('custom_file_path.styles') : custom;[m
[32m+[m[32m$custom_mixins = hexo-config('custom_file_path.mixins') ? "../../../../../" + hexo-config('custom_file_path.mixins') : custom;[m
[32m+[m[32m$custom_variables = hexo-config('custom_file_path.variables') ? "../../../../../" + hexo-config('custom_file_path.variables') : custom;[m
[32m+[m
[32m+[m[32m$variables = base $scheme $custom_variables;[m
[32m+[m[32m$mixins    = base $scheme $custom_mixins;[m
 [m
 [m
 [m
 // Variables Layer[m
 // --------------------------------------------------[m
 for $variable in $variables[m
[31m-  @import "_variables/" + $variable[m
[32m+[m[32m  @import "_variables/" + $variable;[m
 [m
 [m
 // Mixins Layer[m
[36m@@ -42,4 +47,4 @@[m [mfor $mixin in $mixins[m
 [m
 // Custom Layer[m
 // --------------------------------------------------[m
[31m-@import "_custom/custom";[m
[32m+[m[32m@import "_custom/" + $custom_styles;[m
[1mdiff --git a/themes/next/source/js/src/bootstrap.js b/themes/next/source/js/src/bootstrap.js[m
[1mindex d9c33ed..e71de35 100644[m
[1m--- a/themes/next/source/js/src/bootstrap.js[m
[1m+++ b/themes/next/source/js/src/bootstrap.js[m
[36m@@ -4,9 +4,12 @@[m [m$(document).ready(function () {[m
 [m
   $(document).trigger('bootstrap:before');[m
 [m
[31m-  NexT.utils.isMobile() && window.FastClick.attach(document.body);[m
[31m-[m
[31m-  NexT.utils.lazyLoadPostsImages();[m
[32m+[m[32m    /**[m
[32m+[m[32m   * Register JS handlers by condition option.[m
[32m+[m[32m   * Need to add config option in Front-End at 'layout/_partials/head.swig' file.[m
[32m+[m[32m   */[m
[32m+[m[32m  CONFIG.fastclick && NexT.utils.isMobile() && window.FastClick.attach(document.body);[m
[32m+[m[32m  CONFIG.lazyload && NexT.utils.lazyLoadPostsImages();[m
 [m
   NexT.utils.registerESCKeyEvent();[m
 [m
[36m@@ -33,8 +36,6 @@[m [m$(document).ready(function () {[m
   CONFIG.tabs && NexT.utils.registerTabsTag();[m
 [m
   NexT.utils.embeddedVideoTransformer();[m
[31m-  NexT.utils.addActiveClassToMenuItem();[m
[31m-[m
 [m
   // Define Motion Sequence.[m
   NexT.motion.integrator[m
[1mdiff --git a/themes/next/source/js/src/motion.js b/themes/next/source/js/src/motion.js[m
[1mindex 1129179..c6b7225 100644[m
[1m--- a/themes/next/source/js/src/motion.js[m
[1m+++ b/themes/next/source/js/src/motion.js[m
[36m@@ -211,7 +211,7 @@[m [m$(document).ready(function () {[m
       var $logoLineTop = $('.logo-line-before i');[m
       var $logoLineBottom = $('.logo-line-after i');[m
 [m
[31m-      $brand.size() > 0 && sequence.push({[m
[32m+[m[32m      $brand.length > 0 && sequence.push({[m
         e: $brand,[m
         p: {opacity: 1},[m
         o: {duration: 200}[m
[36m@@ -268,7 +268,7 @@[m [m$(document).ready(function () {[m
       function hasElement ($elements) {[m
         $elements = Array.isArray($elements) ? $elements : [$elements];[m
         return $elements.every(function ($element) {[m
[31m-          return $.isFunction($element.size) && $element.size() > 0;[m
[32m+[m[32m          return $element.length > 0;[m
         });[m
       }[m
     },[m
[36m@@ -300,7 +300,7 @@[m [m$(document).ready(function () {[m
       var $collHeaderTransition = CONFIG.motion.transition.coll_header;[m
       var $sidebarAffix = $('.sidebar-inner');[m
       var $sidebarAffixTransition = CONFIG.motion.transition.sidebar;[m
[31m-      var hasPost = $postBlock.size() > 0;[m
[32m+[m[32m      var hasPost = $postBlock.length > 0;[m
 [m
       hasPost ? postMotion() : integrator.next();[m
 [m
[1mdiff --git a/themes/next/source/js/src/post-details.js b/themes/next/source/js/src/post-details.js[m
[1mindex a82bcc2..bfb6e6b 100644[m
[1m--- a/themes/next/source/js/src/post-details.js[m
[1m+++ b/themes/next/source/js/src/post-details.js[m
[36m@@ -87,10 +87,15 @@[m [m$(document).ready(function () {[m
 [m
   // Expand sidebar on post detail page by default, when post has a toc.[m
   var $tocContent = $('.post-toc-content');[m
[31m-  var isSidebarCouldDisplay = CONFIG.sidebar.display === 'post' ||[m
[32m+[m[32m  var display = CONFIG.page.sidebar;[m
[32m+[m[32m  if (typeof display !== 'boolean') {[m
[32m+[m[32m    // There's no definition sidebar in the page front-matter[m
[32m+[m[32m    var isSidebarCouldDisplay = CONFIG.sidebar.display === 'post' ||[m
       CONFIG.sidebar.display === 'always';[m
[31m-  var hasTOC = $tocContent.length > 0 && $tocContent.html().trim().length > 0;[m
[31m-  if (isSidebarCouldDisplay && hasTOC) {[m
[32m+[m[32m    var hasTOC = $tocContent.length > 0 && $tocContent.html().trim().length > 0;[m
[32m+[m[32m    display = isSidebarCouldDisplay && hasTOC;[m
[32m+[m[32m  }[m
[32m+[m[32m  if (display) {[m
     CONFIG.motion.enable ?[m
       (NexT.motion.middleWares.sidebar = function () {[m
           NexT.utils.displaySidebar();[m
[1mdiff --git a/themes/next/source/js/src/utils.js b/themes/next/source/js/src/utils.js[m
[1mindex c1621ef..c68519f 100644[m
[1m--- a/themes/next/source/js/src/utils.js[m
[1m+++ b/themes/next/source/js/src/utils.js[m
[36m@@ -13,9 +13,9 @@[m [mNexT.utils = NexT.$u = {[m
         var imageTitle = $image.attr('title');[m
         var $imageWrapLink = $image.parent('a');[m
 [m
[31m-        if ($imageWrapLink.size() < 1) {[m
[32m+[m[32m        if ($imageWrapLink.length < 1) {[m
 	        var imageLink = ($image.attr('data-original')) ? this.getAttribute('data-original') : this.getAttribute('src');[m
[31m-          $imageWrapLink = $image.wrap('<a href="' + imageLink + '"></a>').parent('a');[m
[32m+[m[32m          $imageWrapLink = $image.wrap('<a data-fancybox="group" href="' + imageLink + '"></a>').parent('a');[m
         }[m
 [m
         $imageWrapLink.addClass('fancybox fancybox.image');[m
[36m@@ -194,16 +194,6 @@[m [mNexT.utils = NexT.$u = {[m
     }[m
   },[m
 [m
[31m-  /**[m
[31m-   * Add `menu-item-active` class name to menu item[m
[31m-   * via comparing location.path with menu item's href.[m
[31m-   */[m
[31m-  addActiveClassToMenuItem: function () {[m
[31m-    var path = window.location.pathname;[m
[31m-    path = path === '/' ? path : path.substring(0, path.length - 1);[m
[31m-    $('.menu-item a[href^="' + path + '"]:first').parent().addClass('menu-item-active');[m
[31m-  },[m
[31m-[m
   hasMobileUA: function () {[m
     var nav = window.navigator;[m
     var ua = nav.userAgent;[m
