<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: highlight.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=highlight.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: highlight.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=highlight.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for highlight.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=highlight.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script src="http://emacswiki.org/emacs/emacs-bootstrap.js"></script>
<!--[if !(lt IE 8)]><!-->
   <script type="text/javascript">
     (function(){var e=document.createElement("script");e.type="text/javascript";e.async=true;e.src=document.location.protocol+"//d1agz031tafz8n.cloudfront.net/thedaywefightback.js/widget.min.js";var t=document.getElementsByTagName("script")[0];t.parentNode.insertBefore(e,t)})()
   </script>
<!--<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22highlight%5c.el%22">highlight.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs-en/download/highlight.el">Download</a></p><pre><span class="comment">;;; highlight.el --- Highlighting commands.</span>
<span class="comment">;;</span>
<span class="comment">;; Filename: highlight.el</span>
<span class="comment">;; Description: Highlighting commands.</span>
<span class="comment">;; Author: Drew Adams</span>
<span class="comment">;; Maintainer: Drew Adams (concat <span class="string">"drew.adams"</span> <span class="string">"@"</span> <span class="string">"oracle"</span> <span class="string">".com"</span>)</span>
<span class="comment">;; Copyright (C) 1995-2014, Drew Adams, all rights reserved.</span>
<span class="comment">;; Created: Wed Oct 11 15:07:46 1995</span>
<span class="comment">;; Version: 0</span>
<span class="comment">;; Package-Requires: ()</span>
<span class="comment">;; Last-Updated: Wed Feb 26 13:03:41 2014 (-0800)</span>
<span class="comment">;;           By: dradams</span>
<span class="comment">;;     Update #: 3499</span>
<span class="comment">;; URL: http://www.emacswiki.org/highlight.el</span>
<span class="comment">;; Doc URL: http://www.emacswiki.org/HighlightLibrary</span>
<span class="comment">;; Keywords: faces, help, local</span>
<span class="comment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x, 24.x</span>
<span class="comment">;;</span>
<span class="comment">;; Features that might be required by this library:</span>
<span class="comment">;;</span>
<span class="comment">;;   `<span class="constant important">apropos</span>', `<span class="constant important">apropos+</span>', `<span class="constant important">avoid</span>', `<span class="constant important">cmds-menu</span>', `<span class="constant important">easymenu</span>',</span>
<span class="comment">;;   `<span class="constant important">fit-frame</span>', `<span class="constant important">frame-fns</span>', `help+20', `<span class="constant important">info</span>', `<span class="constant important">info+</span>',</span>
<span class="comment">;;   `<span class="constant important">menu-bar</span>', `<span class="constant important">menu-bar+</span>', `<span class="constant important">misc-cmds</span>', `<span class="constant important">misc-fns</span>', `<span class="constant important">naked</span>',</span>
<span class="comment">;;   `<span class="constant important">second-sel</span>', `<span class="constant important">strings</span>', `<span class="constant important">thingatpt</span>', `<span class="constant important">thingatpt+</span>', `<span class="constant important">unaccent</span>',</span>
<span class="comment">;;   `w32browser-dlgopen', `<span class="constant important">wid-edit</span>', `<span class="constant important">wid-edit+</span>', `<span class="constant important">widget</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;;; Commentary:</span>
<span class="comment">;;</span>
<span class="comment">;;    Highlighting commands.</span>
<span class="comment">;;</span>
<span class="comment">;;    More description below.</span>
 
<span class="comment">;;(@&gt; <span class="string">"Index"</span>)</span>
<span class="comment">;;</span>
<span class="comment">;;  Index</span>
<span class="comment">;;  -----</span>
<span class="comment">;;</span>
<span class="comment">;;  If you have library `linkd.el' and Emacs 22 or later, load</span>
<span class="comment">;;  `linkd.el' and turn on `<span class="constant important">linkd-mode</span>' now.  It lets you easily</span>
<span class="comment">;;  navigate around the sections of this doc.  Linkd mode will</span>
<span class="comment">;;  highlight this Index, as well as the cross-references and section</span>
<span class="comment">;;  headings throughout this file.  You can get `linkd.el' here:</span>
<span class="comment">;;  http://dto.freeshell.org/notebook/Linkd.html.</span>
<span class="comment">;;</span>
<span class="comment">;;  (@&gt; <span class="string">"Things Defined Here"</span>)</span>
<span class="comment">;;  (@&gt; <span class="string">"Documentation"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"Library `facemenu+.el' Puts Highlight on the Menu"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"User Option `<span class="constant important">hlt-use-overlays-flag</span>'"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"Temporary or Permanent Highlighting"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"Commands"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"User Option `<span class="constant important">hlt-act-on-any-face-flag</span>'"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"Hiding and Showing Text"</span>)</span>
<span class="comment">;;      (@&gt; <span class="string">"Hiding and Showing Text - Icicles Multi-Commands"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"What Gets Highlighted: Region, Buffer, New Text You Type"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"Interference by Font Lock"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"Suggested Bindings"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"See Also"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"Commands That Won't Work in Emacs 20"</span>)</span>
<span class="comment">;;    (@&gt; <span class="string">"To Do"</span>)</span>
<span class="comment">;;  (@&gt; <span class="string">"Change log"</span>)</span>
<span class="comment">;;  (@&gt; <span class="string">"Key Bindings"</span>)</span>
<span class="comment">;;  (@&gt; <span class="string">"Menus"</span>)</span>
<span class="comment">;;  (@&gt; <span class="string">"Variables and Faces"</span>)</span>
<span class="comment">;;  (@&gt; <span class="string">"Misc Functions - Emacs 20+"</span>)</span>
<span class="comment">;;  (@&gt; <span class="string">"Misc Functions - Emacs 21+"</span>)</span>
<span class="comment">;;  (@&gt; <span class="string">"Functions for Highlighting Propertized Text - Emacs 21+"</span>)</span>
<span class="comment">;;  (@&gt; <span class="string">"General functions"</span>)</span>
 
<span class="comment">;;(@* <span class="string">"Things Defined Here"</span>)</span>
<span class="comment">;;</span>
<span class="comment">;;  Things Defined Here</span>
<span class="comment">;;  -------------------</span>
<span class="comment">;;</span>
<span class="comment">;;  Commands defined here:</span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hlt-choose-default-face</span>', `<span class="constant important">hlt-copy-props</span>', `<span class="constant important">hlt-eraser</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-eraser-mouse</span>', `<span class="constant important">hlt-hide-default-face</span>', `<span class="constant important">hlt-highlight</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-highlight-all-prop</span>', `<span class="constant important">hlt-highlight-enclosing-list</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-highlighter</span>', `<span class="constant important">hlt-highlighter-mouse</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-highlight-property-with-value</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-highlight-regexp-region</span>', `<span class="constant important">hlt-highlight-regexp-to-end</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-highlight-region</span>', `<span class="constant important">hlt-highlight-single-quotations</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-highlight-symbol</span>', `<span class="constant important">hlt-mouse-copy-props</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-mouse-face-each-line</span>', `<span class="constant important">hlt-next-face</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-next-highlight</span>', `<span class="constant important">hlt-paste-props</span>', `<span class="constant important">hlt-previous-face</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-previous-highlight</span>', `<span class="constant important">hlt-replace-highlight-face</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-show-default-face</span>', `<span class="constant important">hlt-toggle-act-on-any-face-flag</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-toggle-link-highlighting</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-toggle-property-highlighting</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-toggle-use-overlays-flag</span>', `<span class="constant important">hlt-unhighlight-all-prop</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-unhighlight-regexp-region</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-unhighlight-regexp-to-end</span>', `<span class="constant important">hlt-unhighlight-region</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-unhighlight-region-for-face</span>', `<span class="constant important">hlt-unhighlight-symbol</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-yank-props</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;  User options (variables) defined here:</span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hlt-act-on-any-face-flag</span>', `<span class="constant important">hlt-auto-face-backgrounds</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-auto-face-foreground</span>', `<span class="constant important">hlt-auto-faces-flag</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-default-copy/yank-props</span>', `<span class="constant important">hlt-max-region-no-warning</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-use-overlays-flag</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;  Faces defined here:</span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hlt-property-highlight</span>', `<span class="constant important">minibuffer-prompt</span>' (for Emacs 20).</span>
<span class="comment">;;</span>
<span class="comment">;;  Non-interactive functions defined here:</span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hlt-+/--highlight-regexp-read-args</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-+/--highlight-regexp-region</span>', `<span class="constant important">hlt-add-listifying</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-add-to-invisibility-spec</span>', `<span class="constant important">hlt-delete-highlight-overlay</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-highlight-faces-in-buffer</span>', `<span class="constant important">hlt-flat-list</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-highlight-faces-in-buffer</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-listify-invisibility-spec</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-mouse-toggle-link-highlighting</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-mouse-toggle-property-highlighting</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-nonempty-region-p</span>', `<span class="constant important">hlt-props-to-copy/yank</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-read-bg/face-name</span>', `<span class="constant important">hlt-read-props-completing</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-region-or-buffer-limits</span>', `<span class="constant important">hlt-remove-if-not</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-set-intersection</span>', `<span class="constant important">hlt-set-union</span>', `<span class="constant important">hlt-subplist</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-tty-colors</span>', `<span class="constant important">hlt-unhighlight-for-overlay</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;  Internal variables defined here:</span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hlt-copied-props</span>', `<span class="constant important">hlt-face-nb</span>', `<span class="constant important">hlt-last-face</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-last-regexp</span>', `<span class="constant important">hlt-map</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-previous-use-overlays-flag-value</span>',</span>
<span class="comment">;;    `<span class="constant important">hlt-prop-highlighting-state</span>'.</span>
 
<span class="comment">;;(@* <span class="string">"Documentation"</span>)</span>
<span class="comment">;;</span>
<span class="comment">;;  Documentation</span>
<span class="comment">;;  -------------</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Libraries `facemenu+.el' and `mouse3.el' put Highlight on the Menu"</span>)</span>
<span class="comment">;;  ** Libraries `facemenu+.el' and `mouse3.el' put Highlight on the Menu **</span>
<span class="comment">;;</span>
<span class="comment">;;  If you load library `facemenu+.el' after you load library</span>
<span class="comment">;;  `highlight.el' then commands defined here will also be available</span>
<span class="comment">;;  on a `<span class="constant important">Highlight</span>' submenu in the Text Properties menus.</span>
<span class="comment">;;</span>
<span class="comment">;;  If you load library `mouse3.el' after you load library</span>
<span class="comment">;;  `highlight.el' then:</span>
<span class="comment">;;</span>
<span class="comment">;;    * Commands defined here will also be available on a `<span class="constant important">Highlight</span>'</span>
<span class="comment">;;      submenu of the `<span class="constant important">Region</span>' right-click popup menu.</span>
<span class="comment">;;</span>
<span class="comment">;;    * Commands `<span class="constant important">hlt-highlight-symbol</span>' and `<span class="constant important">hlt-unhighlight-symbol</span>'</span>
<span class="comment">;;      will be available on the `Thing at Pointer' submenu of the `No</span>
<span class="comment">;;      Region' right-click popup menu.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"User Option `<span class="constant important">hlt-use-overlays-flag</span>'"</span>)</span>
<span class="comment">;;  ** User Option `<span class="constant important">hlt-use-overlays-flag</span>'</span>
<span class="comment">;;</span>
<span class="comment">;;  You can highlight text in two ways using this library, depending</span>
<span class="comment">;;  on the value of user option `<span class="constant important">hlt-use-overlays-flag</span>':</span>
<span class="comment">;;</span>
<span class="comment">;;   - non-nil means to highlight using overlays</span>
<span class="comment">;;   - nil means to highlight using text properties</span>
<span class="comment">;;</span>
<span class="comment">;;  Overlays are independent from the text itself.  They are not</span>
<span class="comment">;;  picked up when you copy and paste text.  By default, highlighting</span>
<span class="comment">;;  uses overlays.</span>
<span class="comment">;;</span>
<span class="comment">;;  Although highlighting recognizes only nil and non-nil values for</span>
<span class="comment">;;  `<span class="constant important">hlt-use-overlays-flag</span>', other actions can have different</span>
<span class="comment">;;  behavior, depending on the non-nil value.  If it is `<span class="constant important">only</span>' (<span class="keyword cl">the</span></span>
<span class="comment">;;  default value), then only overlay highlighting is affected.  If it</span>
<span class="comment">;;  is any other non-nil value, then both overlay highlighting and</span>
<span class="comment">;;  text-property highlighting are effected.  This is the case, for</span>
<span class="comment">;;  instance, for unhighlighting and for navigating among highlights.</span>
<span class="comment">;;</span>
<span class="comment">;;  For example, for unhighlighting, if `<span class="constant important">hlt-use-overlays-flag</span>' is</span>
<span class="comment">;;  non-nil, then overlay highlighting is removed.  If it is not</span>
<span class="comment">;;  `<span class="constant important">only</span>', then text-property highlighting is removed.  A value of</span>
<span class="comment">;;  nil thus removes both overlays and text properties.</span>
<span class="comment">;;</span>
<span class="comment">;;  Keep this sensitivity to the value of `<span class="constant important">hlt-use-overlays-flag</span>' in</span>
<span class="comment">;;  mind.  For example, if you change the value after adding some</span>
<span class="comment">;;  highlighting, then that highlighting might not be removed by</span>
<span class="comment">;;  unhighlighting, unless you change the value back again.</span>
<span class="comment">;;</span>
<span class="comment">;;  You can toggle the value of `<span class="constant important">hlt-use-overlays-flag</span>' at any time</span>
<span class="comment">;;  between nil and its previous non-nil value, using command</span>
<span class="comment">;;  `<span class="constant important">hlt-toggle-use-overlays-flag</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Temporary or Permanent Highlighting"</span>)</span>
<span class="comment">;; ** <span class="string">"Temporary or Permanent Highlighting"</span> **</span>
<span class="comment">;;</span>
<span class="comment">;;  Generally, highlighting you add is temporary: it is not saved when</span>
<span class="comment">;;  you write your buffer to disk.  However, Emacs has a curious and</span>
<span class="comment">;;  unfamiliar feature called <span class="string">"formatted"</span> or <span class="string">"enriched"</span> text mode,</span>
<span class="comment">;;  which does record highlighting permanently.  See the Emacs manual,</span>
<span class="comment">;;  node `Requesting Formatted Text'.</span>
<span class="comment">;;</span>
<span class="comment">;;  To save highlighting permanently, do the following:</span>
<span class="comment">;;</span>
<span class="comment">;;  1. `M-x enriched-mode', to put your file buffer in minor mode</span>
<span class="comment">;;     `<span class="constant important">enriched-mode</span>'.  You will see `<span class="constant important">Enriched</span>' in the mode line.</span>
<span class="comment">;;</span>
<span class="comment">;;  2. Choose text-property highlighting, not overlay highlighting, by</span>
<span class="comment">;;     setting option `<span class="constant important">hlt-use-overlays-flag</span>' to `<span class="constant important">nil</span>'.  To do this</span>
<span class="comment">;;     using Customize, choose menu item `Highlight using text</span>
<span class="comment">;;     properties, not overlays'.</span>
<span class="comment">;;</span>
<span class="comment">;;  3. Choose the highlight face to use:</span>
<span class="comment">;;     `M-x hlt-choose-default-face'.</span>
<span class="comment">;;</span>
<span class="comment">;;  4. Highlight in any way provided by library `highlight.el'.  For</span>
<span class="comment">;;     example, use `<span class="constant important">hlt-highlighter</span>' (personally, I bind it to `C-x</span>
<span class="comment">;;     mouse-2') to drag-highlight as if using a marker pen.</span>
<span class="comment">;;</span>
<span class="comment">;;  5. Save your file.</span>
<span class="comment">;;</span>
<span class="comment">;;     Note that, although highlighting in enriched-text mode modifies</span>
<span class="comment">;;     the buffer, it does not appear modified (check the beginning of</span>
<span class="comment">;;     the mode line), so if you make no other changes then using `C-x</span>
<span class="comment">;;     C-s' will not save your highlighting changes.  To remedy this,</span>
<span class="comment">;;     just do something besides highlighting - e.g., add a space and</span>
<span class="comment">;;     delete it - so that `C-x C-s' will save to disk.</span>
<span class="comment">;;</span>
<span class="comment">;;  When you reopen your file later, it will automatically be in</span>
<span class="comment">;;  enriched mode, and your highlighting will show.  However, be aware</span>
<span class="comment">;;  that font-locking interferes with enriched mode, so you will</span>
<span class="comment">;;  probably want to use it on files where you don't use font-locking.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Commands"</span>)</span>
<span class="comment">;;  ** Commands **</span>
<span class="comment">;;</span>
<span class="comment">;;  You can use any face to highlight, and you can apply a mouse face</span>
<span class="comment">;;  instead of a face, if you like.  A mouse face shows up only when</span>
<span class="comment">;;  the mouse pointer is over it.</span>
<span class="comment">;;</span>
<span class="comment">;;  The main command to choose a face to use for highlighting (or for</span>
<span class="comment">;;  unhighlighting) is `<span class="constant important">hlt-choose-default-face</span>'.  It reads a face</span>
<span class="comment">;;  name, with completion.</span>
<span class="comment">;;</span>
<span class="comment">;;  But you can alternatively choose a color name instead of a face</span>
<span class="comment">;;  name.  The completion candidates are annotated in buffer</span>
<span class="comment">;;  `<span class="constant important">*Completions*</span>' with `<span class="constant important">Face</span>' or `<span class="constant important">Color</span>', to help you identify them.</span>
<span class="comment">;;</span>
<span class="comment">;;  If you choose a color instead of a face then an unnamed pseudo</span>
<span class="comment">;;  face is created and used.  It has the chosen color as background,</span>
<span class="comment">;;  and its foreground color is determined by the value of user option</span>
<span class="comment">;;  `<span class="constant important">hlt-auto-face-foreground</span>'.  If that option is nil then</span>
<span class="comment">;;  highlighting does not change the existing foreground color.</span>
<span class="comment">;;  Otherwise, the option value is the foreground color used for</span>
<span class="comment">;;  highlighting.</span>
<span class="comment">;;</span>
<span class="comment">;;  Another way to choose the highlighting face is to use command</span>
<span class="comment">;;  `<span class="constant important">hlt-next-face</span>' or `<span class="constant important">hlt-previous-face</span>'.  These cycle among a</span>
<span class="comment">;;  smaller set of faces and background colors, the elements in the</span>
<span class="comment">;;  list value of option `<span class="constant important">hlt-auto-face-backgrounds</span>'.  You can use a</span>
<span class="comment">;;  numeric prefix argument with these commands to choose any of the</span>
<span class="comment">;;  elements by its absolute position in the list.</span>
<span class="comment">;;</span>
<span class="comment">;;  Choosing the default highlighting face using</span>
<span class="comment">;;  `<span class="constant important">hlt-choose-default-face</span>', `<span class="constant important">hlt-next-face</span>', or `<span class="constant important">hlt-previous-face</span>'</span>
<span class="comment">;;  affects the next highlighting or unhighlighting operation.  You</span>
<span class="comment">;;  can also choose to automatically cycle among the faces defined by</span>
<span class="comment">;;  `<span class="constant important">hlt-auto-face-backgrounds</span>', with each (un)highlighting command</span>
<span class="comment">;;  using the next face in the list.  To choose this behavior,</span>
<span class="comment">;;  customize option `<span class="constant important">hlt-auto-faces-flag</span>' to non-nil.</span>
<span class="comment">;;</span>
<span class="comment">;;  The commands with `<span class="constant important">region</span>' in their name act on the text in the</span>
<span class="comment">;;  active region.  If the region is not active then they act on the</span>
<span class="comment">;;  text in the whole buffer.  The commands with `<span class="constant important">to-end</span>' in their</span>
<span class="comment">;;  name act on the text from point to the end of the buffer.  See</span>
<span class="comment">;;  also (@* <span class="string">"What Gets Highlighted: Region, Buffer, New Text You Type"</span>).</span>
<span class="comment">;;</span>
<span class="comment">;;  The commands you will use the most often are perhaps</span>
<span class="comment">;;  `<span class="constant important">hlt-highlight</span>', `<span class="constant important">hlt-highlighter</span>', `<span class="constant important">hlt-highlight-symbol</span>',</span>
<span class="comment">;;  `<span class="constant important">hlt-next-highlight</span>', and `<span class="constant important">hlt-previous-highlight</span>', as well as</span>
<span class="comment">;;  unhighlighting commands.  You might also often use the various</span>
<span class="comment">;;  commands to hide and show highlighted text.</span>
<span class="comment">;;</span>
<span class="comment">;;  You can use command `<span class="constant important">hlt-highlight</span>' to highlight or unhighlight</span>
<span class="comment">;;  the region, or to highlight or unhighlight a regexp throughout the</span>
<span class="comment">;;  region, depending on the prefix argument.  It combines the</span>
<span class="comment">;;  behaviors of commands `<span class="constant important">hlt-highlight-region</span>',</span>
<span class="comment">;;  `<span class="constant important">hlt-unhighlight-region</span>', `<span class="constant important">hlt-highlight-regexp-region</span>', and</span>
<span class="comment">;;  `<span class="constant important">hlt-highlight-regexp-region</span>'.  I suggest that you bind</span>
<span class="comment">;;  `<span class="constant important">hlt-highlight</span>' to a key - I use `C-x C-y'.</span>
<span class="comment">;;</span>
<span class="comment">;;  Commands `<span class="constant important">hlt-highlight-regexp-to-end</span>' and</span>
<span class="comment">;;  `<span class="constant important">hlt-unhighlight-regexp-to-end</span>' highlight and unhighlight a regexp</span>
<span class="comment">;;  from point to the end of the buffer, respectively.</span>
<span class="comment">;;</span>
<span class="comment">;;  Command `<span class="constant important">hlt-highlighter</span>' lets you highlight text by simply</span>
<span class="comment">;;  dragging the mouse, just as you would use a highlighter (marker).</span>
<span class="comment">;;  You can thus highlight text the same way that you drag the mouse</span>
<span class="comment">;;  to define the region.</span>
<span class="comment">;;</span>
<span class="comment">;;  Command `<span class="constant important">hlt-eraser</span>' lets you delete highlighting by dragging the</span>
<span class="comment">;;  mouse.  However, its behavior is different for overlays and text</span>
<span class="comment">;;  properties, and it is perhaps different from you expect.  If</span>
<span class="comment">;;  option `<span class="constant important">hlt-use-overlays-flag</span>' is not `<span class="constant important">only</span>' then it removes</span>
<span class="comment">;;  text-property highlighting for *ALL* faces (not just highlighting</span>
<span class="comment">;;  faces).</span>
<span class="comment">;;</span>
<span class="comment">;;  A prefix arg for `<span class="constant important">hlt-highlighter</span>' and `<span class="constant important">hlt-eraser</span>' acts the same</span>
<span class="comment">;;  as for `<span class="constant important">hlt-next-face</span>': it lets you choose the face to use.  It</span>
<span class="comment">;;  has no effect for `<span class="constant important">hlt-eraser</span>' unless `<span class="constant important">hlt-use-overlays-flag</span>' is</span>
<span class="comment">;;  `<span class="constant important">only</span>', in which case it erases the Nth face in</span>
<span class="comment">;;  `<span class="constant important">hlt-auto-face-backgrounds</span>', where N is the prefix arg.</span>
<span class="comment">;;</span>
<span class="comment">;;  If you use Emacs 21 or later, you can use various commands that</span>
<span class="comment">;;  highlight and unhighlight text that has certain text properties</span>
<span class="comment">;;  with given values.  You can use them to highlight all text in the</span>
<span class="comment">;;  region or buffer that has a given property value.  An example is</span>
<span class="comment">;;  highlighting all links (text with property `<span class="constant important">mouse-face</span>').  These</span>
<span class="comment">;;  commands are:</span>
<span class="comment">;;</span>
<span class="comment">;;  `<span class="constant important">hlt-highlight-all-prop</span>' - Highlight text that has a given</span>
<span class="comment">;;                             property with any (non-nil) value.</span>
<span class="comment">;;</span>
<span class="comment">;;  `<span class="constant important">hlt-highlight-property-with-value</span>' - Highlight text that has a</span>
<span class="comment">;;                             given property with certain values.</span>
<span class="comment">;;</span>
<span class="comment">;;  `<span class="constant important">hlt-unhighlight-all-prop</span>' - Unhighlight highlighted propertized</span>
<span class="comment">;;                             text.</span>
<span class="comment">;;</span>
<span class="comment">;;  `<span class="constant important">hlt-mouse-toggle-link-highlighting</span>' - Alternately highlight and</span>
<span class="comment">;;                             unhighlight links on a mouse click.</span>
<span class="comment">;;</span>
<span class="comment">;;  `<span class="constant important">hlt-toggle-link-highlighting</span>' - Alternately highlight and</span>
<span class="comment">;;                             unhighlight links.</span>
<span class="comment">;;</span>
<span class="comment">;;  `<span class="constant important">hlt-mouse-toggle-property-highlighting</span>' - Alternately highlight</span>
<span class="comment">;;                             and unhighlight propertized text on a</span>
<span class="comment">;;                             mouse click.</span>
<span class="comment">;;</span>
<span class="comment">;;  `<span class="constant important">hlt-toggle-property-highlighting</span>' - Alternately highlight and</span>
<span class="comment">;;                             unhighlight propertized text.</span>
<span class="comment">;;</span>
<span class="comment">;;  As always for library `highlight.el', this <span class="string">"highlighting"</span> can use</span>
<span class="comment">;;  property `<span class="constant important">mouse-face</span>' instead of `<span class="constant important">face</span>'.  You could, for example,</span>
<span class="comment">;;  highlight, using `<span class="constant important">mouse-face</span>', all text that has property `<span class="constant important">foo</span>' -</span>
<span class="comment">;;  or that has property `<span class="constant important">face</span>', for that matter.</span>
<span class="comment">;;</span>
<span class="comment">;;  If you use Emacs 21 or later, you can use commands</span>
<span class="comment">;;  `<span class="constant important">hlt-next-highlight</span>' and `<span class="constant important">hlt-previous-highlight</span>' to navigate</span>
<span class="comment">;;  among highlights of a given face.</span>
<span class="comment">;;</span>
<span class="comment">;;  You can unhighlight the region/buffer or a regexp in the</span>
<span class="comment">;;  region/buffer using command `<span class="constant important">hlt-unhighlight-region</span>' or</span>
<span class="comment">;;  `<span class="constant important">hlt-unhighlight-regexp-region</span>'.  If you use overlay highlighting</span>
<span class="comment">;;  then you can use command `<span class="constant important">hlt-unhighlight-region-for-face</span>' to</span>
<span class="comment">;;  unhighlight the region/buffer for an individual highlighting face</span>
<span class="comment">;;  - other highlighting faces remain.</span>
<span class="comment">;;</span>
<span class="comment">;;  You can replace a highlighting face in the region/buffer by</span>
<span class="comment">;;  another, using command `<span class="constant important">hlt-replace-highlight-face</span>'.  With a</span>
<span class="comment">;;  prefix argument, property `<span class="constant important">mouse-face</span>' is used, not property</span>
<span class="comment">;;  `<span class="constant important">face</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Copy and Yank (Paste) Text Properties"</span>)</span>
<span class="comment">;;  ** Copy and Yank (Paste) Text Properties **</span>
<span class="comment">;;</span>
<span class="comment">;;  You can highlight or unhighlight text by simply copying existing</span>
<span class="comment">;;  highlighting (or lack of any highlighting) from anywhere in Emacs</span>
<span class="comment">;;  and yanking (pasting) it anywhere else.</span>
<span class="comment">;;</span>
<span class="comment">;;  Put differently, you can copy and yank a set of text properties.</span>
<span class="comment">;;  You can use these commands to copy and yank any text properties,</span>
<span class="comment">;;  not just `<span class="constant important">face</span>' or `<span class="constant important">mouse-face</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;  To copy the text properties at a given position, use command</span>
<span class="comment">;;  `<span class="constant important">hlt-copy-props</span>'.  You can then use command `<span class="constant important">hlt-yank-props</span>' to</span>
<span class="comment">;;  yank those properties to the active region anywhere.  If the set</span>
<span class="comment">;;  of properties that you copy is empty, then yanking means</span>
<span class="comment">;;  effectively removing all text properties.</span>
<span class="comment">;;</span>
<span class="comment">;;  User option `<span class="constant important">hlt-default-copy/yank-props</span>' controls which text</span>
<span class="comment">;;  properties to copy and yank, by default.  The default value of the</span>
<span class="comment">;;  option includes only `<span class="constant important">face</span>', which means that only property `<span class="constant important">face</span>'</span>
<span class="comment">;;  is copied and pasted.  That is typically what you want, for</span>
<span class="comment">;;  highlighting purposes.  A value of `<span class="constant important">t</span>' for</span>
<span class="comment">;;  `<span class="constant important">hlt-default-copy/yank-props</span>' means use all properties.</span>
<span class="comment">;;</span>
<span class="comment">;;  You can further control which text properties are copied or yanked</span>
<span class="comment">;;  when you use the commands, by using a prefix argument.  A plain or</span>
<span class="comment">;;  non-negative prefix arg means copy or yank all available text</span>
<span class="comment">;;  properties.  A negative prefix arg (e.g. `<span class="constant important">C--</span>') means you are</span>
<span class="comment">;;  prompted for which text properties to use, among those available.</span>
<span class="comment">;;</span>
<span class="comment">;;  For copying, the available properties are those among</span>
<span class="comment">;;  `<span class="constant important">hlt-default-copy/yank-props</span>' that are also present at the copy</span>
<span class="comment">;;  position.  For yanking, the available properties are those among</span>
<span class="comment">;;  `<span class="constant important">hlt-default-copy/yank-props</span>' that have previously (last) been</span>
<span class="comment">;;  copied.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"User Option `<span class="constant important">hlt-act-on-any-face-flag</span>'"</span>)</span>
<span class="comment">;;  ** User Option `<span class="constant important">hlt-act-on-any-face-flag</span>' **</span>
<span class="comment">;;</span>
<span class="comment">;;  Library `<span class="constant important">highlight</span>' generally acts only on faces that it controls,</span>
<span class="comment">;;  that is, faces that you have explicitly asked it to use for</span>
<span class="comment">;;  highlighting.  It sets the text property or overlay property</span>
<span class="comment">;;  `<span class="constant important">hlt-highlight</span>' on such highlighted text, so that it can recognize</span>
<span class="comment">;;  which faces it has responsibility for.</span>
<span class="comment">;;</span>
<span class="comment">;;  Sometimes, you might want to hide and show text other than that</span>
<span class="comment">;;  controlled by library `<span class="constant important">highlight</span>'.  Similarly, you might sometimes</span>
<span class="comment">;;  want to navigate among faces other than those used for</span>
<span class="comment">;;  highlighting.  You can control this using option</span>
<span class="comment">;;  `<span class="constant important">hlt-act-on-any-face-flag</span>', which you can toggle at any time using</span>
<span class="comment">;;  command `<span class="constant important">hlt-toggle-act-on-any-face-flag</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Hiding and Showing Text"</span>)</span>
<span class="comment">;;  ** Hiding and Showing Text **</span>
<span class="comment">;;</span>
<span class="comment">;;  You can hide and show text that you have highlighted.  You will</span>
<span class="comment">;;  want to read the Emacs-Lisp manual (Elisp), section Invisible</span>
<span class="comment">;;  Text, to understand better what this entails.  In particular, you</span>
<span class="comment">;;  should understand that for library `highlight.el', hiding text</span>
<span class="comment">;;  means adding the symbol naming the face to be hidden to both:</span>
<span class="comment">;;</span>
<span class="comment">;;  1. a text or overlay `<span class="constant important">invisible</span>' property, making the text or</span>
<span class="comment">;;     overlay susceptible to being hidden by buffer-local variable</span>
<span class="comment">;;     `<span class="constant important">buffer-invisibility-spec</span>', and</span>
<span class="comment">;;</span>
<span class="comment">;;  2. the buffer's `<span class="constant important">buffer-invisibility-spec</span>', so that it in fact</span>
<span class="comment">;;     becomes hidden.</span>
<span class="comment">;;</span>
<span class="comment">;;  After text has been hidden this way, and unless the highlighting</span>
<span class="comment">;;  has been removed completely by unhighlighting the text, the</span>
<span class="comment">;;  `<span class="constant important">invisible</span>' property of that text keeps the names of the faces</span>
<span class="comment">;;  that have been applied to that text and hidden previously, even</span>
<span class="comment">;;  after you show that text again.  Showing a hidden face simply</span>
<span class="comment">;;  removes it from the `<span class="constant important">buffer-invisibility-spec</span>'; it does not change</span>
<span class="comment">;;  any `<span class="constant important">invisible</span>' properties.</span>
<span class="comment">;;</span>
<span class="comment">;;  For example, if you hide face `<span class="constant important">foo</span>' at some buffer position:</span>
<span class="comment">;;</span>
<span class="comment">;;  1. The `<span class="constant important">invisible</span>' property of the text or overlay at that</span>
<span class="comment">;;     position is updated to include `<span class="constant important">foo</span>'.  If there are no other</span>
<span class="comment">;;     faces that have been applied to this text and then hidden, the</span>
<span class="comment">;;     `<span class="constant important">invisible</span>' property is just `(foo)'.</span>
<span class="comment">;;</span>
<span class="comment">;;  2. `<span class="constant important">buffer-invisibility-spec</span>' is also updated to include `<span class="constant important">foo</span>'.</span>
<span class="comment">;;     This hides all text properties and overlay properties with</span>
<span class="comment">;;     `<span class="constant important">invisible</span>' property `<span class="constant important">foo</span>', throughout the buffer.  If there</span>
<span class="comment">;;     are no other invisible faces in the buffer, then</span>
<span class="comment">;;     `<span class="constant important">buffer-invisibility-spec</span>' has value (foo).</span>
<span class="comment">;;</span>
<span class="comment">;;  If you then show face `<span class="constant important">foo</span>' at that same buffer position, there is</span>
<span class="comment">;;  no change to the `<span class="constant important">invisible</span>' property.  `<span class="constant important">buffer-invisibility-spec</span>'</span>
<span class="comment">;;  is updated, by removing `<span class="constant important">foo</span>': if it was (foo), it becomes ().</span>
<span class="comment">;;</span>
<span class="comment">;;  There are several commands for hiding and showing highlighted</span>
<span class="comment">;;  text.  The basic commands for hiding and showing are</span>
<span class="comment">;;  `<span class="constant important">hlt-hide-default-face</span>' and `<span class="constant important">hlt-show-default-face</span>', which you can</span>
<span class="comment">;;  use to hide and show the face last used for highlighting.  With a</span>
<span class="comment">;;  prefix argument, you are prompted for a different face to hide or</span>
<span class="comment">;;  show; it then becomes the default face for highlighting.  You can</span>
<span class="comment">;;  also change the default highlighting face at any time using</span>
<span class="comment">;;  command `<span class="constant important">hlt-choose-default-face</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Hiding and Showing Text - Icicles Multi-Commands"</span>)</span>
<span class="comment">;;  *** Hiding and Showing Text - Icicles Multi-Commands ***</span>
<span class="comment">;;</span>
<span class="comment">;;  The other hide and show commands depend on your also using</span>
<span class="comment">;;  Icicles, which is a set of libraries that offer enhanced</span>
<span class="comment">;;  completion.  Complete information about Icicles is here:</span>
<span class="comment">;;  `http://www.emacswiki.org/emacs/Icicles'.  You can obtain Icicles</span>
<span class="comment">;;  here: `http://www.emacswiki.org/emacs/Icicles_-_Libraries'.</span>
<span class="comment">;;</span>
<span class="comment">;;  The Icicles commands defined for `highlight.el' are the following:</span>
<span class="comment">;;</span>
<span class="comment">;;  `<span class="constant important">icicle-choose-faces</span>', `<span class="constant important">icicle-choose-invisible-faces</span>',</span>
<span class="comment">;;  `<span class="constant important">icicle-choose-visible-faces</span>', `<span class="constant important">icicle-hide-faces</span>',</span>
<span class="comment">;;  `<span class="constant important">icicle-hide-only-faces</span>', `<span class="constant important">icicle-show-faces</span>',</span>
<span class="comment">;;  `<span class="constant important">icicle-show-only-faces</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;  These are all Icicles multi-commands, which means that they each</span>
<span class="comment">;;  let you choose multiple completion candidates or all candidates</span>
<span class="comment">;;  that match your current input (a regexp).  To use them you must</span>
<span class="comment">;;  also use Icicles.  You can use command `<span class="constant important">icicle-hide-faces</span>' to hide</span>
<span class="comment">;;  any number of visible faces.  Any text is hidden that has that</span>
<span class="comment">;;  face as a text property or an overlay property, depending on the</span>
<span class="comment">;;  value of `<span class="constant important">hlt-use-overlays-flag</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;  Command `<span class="constant important">icicle-show-faces</span>' is the opposite of</span>
<span class="comment">;;  `<span class="constant important">icicle-hide-faces</span>': it shows invisible text that has the faces</span>
<span class="comment">;;  you choose.  Neither `<span class="constant important">icicle-hide-faces</span>' nor `<span class="constant important">icicle-show-faces</span>'</span>
<span class="comment">;;  has any effect on other faces, besides those you choose to hide or</span>
<span class="comment">;;  show, respectively; they each do only one thing, hide or show.</span>
<span class="comment">;;</span>
<span class="comment">;;  Command `<span class="constant important">icicle-hide-only-faces</span>' hides the faces you choose, and</span>
<span class="comment">;;  shows all other faces, and command `<span class="constant important">icicle-show-only-faces</span>' does</span>
<span class="comment">;;  the opposite.  You can thus use these commands to specify exactly</span>
<span class="comment">;;  what faces should be invisible and visible.  Empty input means</span>
<span class="comment">;;  none: If you choose no faces to hide (that is, hit `<span class="constant important">RET</span>' with an</span>
<span class="comment">;;  empty minibuffer), then all faces will be made visible; if you</span>
<span class="comment">;;  choose no faces to show, then all will be hidden.</span>
<span class="comment">;;</span>
<span class="comment">;;  Currently, face attributes for highlighting are combined when</span>
<span class="comment">;;  overlays overlap, but the same is not true for text properties.</span>
<span class="comment">;;  For example, if you highlight a word with face `<span class="constant important">foo</span>', and then you</span>
<span class="comment">;;  highlight it with face `<span class="constant important">bar</span>', only `<span class="constant important">bar</span>' remains as the face for</span>
<span class="comment">;;  that word.  With overlays, the attributes of the two faces are</span>
<span class="comment">;;  composed.  When you hide or show faces, this behavior difference</span>
<span class="comment">;;  has an effect.</span>
<span class="comment">;;</span>
<span class="comment">;;  You can hide text using the commands in this library for any of</span>
<span class="comment">;;  the purposes that you might use invisible text in Emacs.  This</span>
<span class="comment">;;  gives you an easy, interactive way to control which sections of</span>
<span class="comment">;;  text are seen by search and other Emacs tools.  Use the regexp</span>
<span class="comment">;;  highlighting commands, for instance, to highlight text</span>
<span class="comment">;;  syntactically, and then hide that highlighted text.  Or use</span>
<span class="comment">;;  `<span class="constant important">hlt-highlighter</span>' to sweep over text that you want to hide with</span>
<span class="comment">;;  the mouse.</span>
<span class="comment">;;</span>
<span class="comment">;;  Hiding and showing faces also provides a <span class="string">"conditional text"</span></span>
<span class="comment">;;  feature similar to that available in desktop publishing</span>
<span class="comment">;;  applications such as Adobe Framemaker.  Publishers often use such</span>
<span class="comment">;;  a feature to produce different output documents from the same</span>
<span class="comment">;;  source document (<span class="string">"single sourcing"</span>).  You can use this feature</span>
<span class="comment">;;  similarly, if you have an application (printing is one example)</span>
<span class="comment">;;  that is sensitive to whether text is visible or invisible.  One</span>
<span class="comment">;;  caveat: Emacs faces are not saved when you save your file.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"What Gets Highlighted: Region, Buffer, New Text You Type"</span>)</span>
<span class="comment">;;  ** What Gets Highlighted: Region, Buffer, New Text You Type **</span>
<span class="comment">;;</span>
<span class="comment">;;  Most mention of the <span class="string">"region"</span> in this commentary should really say</span>
<span class="comment">;;  <span class="string">"active region or buffer"</span>.  If the region is active and non-empty,</span>
<span class="comment">;;  then only the text in the region is targeted by the commands in</span>
<span class="comment">;;  this library.  This lets you easily control the scope of</span>
<span class="comment">;;  operations.</span>
<span class="comment">;;</span>
<span class="comment">;;  If the region is not active or it is empty, then:</span>
<span class="comment">;;</span>
<span class="comment">;;  - If `<span class="constant important">hlt-use-overlays-flag</span>' is nil and there is no prefix arg,</span>
<span class="comment">;;    then the face is applied to the next characters that you type.</span>
<span class="comment">;;</span>
<span class="comment">;;  - Otherwise, the face is applied to the entire buffer (or the</span>
<span class="comment">;;    current restriction, if the buffer is narrowed).</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Interference by Font Lock"</span>)</span>
<span class="comment">;;  ** Interference by Font Lock **</span>
<span class="comment">;;</span>
<span class="comment">;;  If you use Emacs 22 or later, then you can use this library in</span>
<span class="comment">;;  conjunction with library `font-lock+.el' (it is loaded</span>
<span class="comment">;;  automatically, if available).  That prevents font-locking from</span>
<span class="comment">;;  removing any highlighting face properties that you apply using the</span>
<span class="comment">;;  commands defined here.</span>
<span class="comment">;;</span>
<span class="comment">;;  Otherwise, when `<span class="constant important">hlt-use-overlays-flag</span>' is nil, font-lock</span>
<span class="comment">;;  highlighting will interfere with the highlighting of this library.</span>
<span class="comment">;;  In most cases, you will be able to highlight text, but sooner or</span>
<span class="comment">;;  later font-lock will erase that highlighting when it refontifies</span>
<span class="comment">;;  the buffer.  If `<span class="constant important">hlt-use-overlays-flag</span>' is non-nil, there is no</span>
<span class="comment">;;  such problem : font-lock has no effect on overlays.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Suggested Bindings"</span>)</span>
<span class="comment">;;  ** Suggested Bindings **</span>
<span class="comment">;;</span>
<span class="comment">;;  Library `highlight.el' binds many of its commands to keys on the</span>
<span class="comment">;;  prefix key `C-x X'.  It also adds menu items to the `<span class="constant important">Region</span>'</span>
<span class="comment">;;  submenu of the `<span class="constant important">Edit</span>' menu-bar menu, if you have a `<span class="constant important">Region</span>'</span>
<span class="comment">;;  submenu.  To obtain this menu, load library `menu-bar+.el'.</span>
<span class="comment">;;</span>
<span class="comment">;;  Library `highlight.el' makes no other key bindings.  Here are some</span>
<span class="comment">;;  additional, suggested bindings (`C-x C-y', `C-x mouse-2', `C-x</span>
<span class="comment">;;  S-mouse-2', `<span class="constant important">C-S-p</span>', and `<span class="constant important">C-S-n</span>', respectively):</span>
<span class="comment">;;</span>
<span class="comment">;;   (define-key ctl-x-map [(control ?y)]     'hlt-highlight)</span>
<span class="comment">;;   (define-key ctl-x-map [(down-mouse-2)]   'hlt-highlighter)</span>
<span class="comment">;;   (define-key ctl-x-map [(S-down-mouse-2)] 'hlt-eraser)</span>
<span class="comment">;;   (global-set-key [(shift control ?p)]     'hlt-previous-highlight)</span>
<span class="comment">;;   (global-set-key [(shift control ?n)]     'hlt-next-highlight)</span>
<span class="comment">;;   (global-set-key [(control meta shift ?s)]</span>
<span class="comment">;;                   'hlt-highlight-enclosing-list)</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"See Also"</span>)</span>
<span class="comment">;;  ** See Also **</span>
<span class="comment">;;</span>
<span class="comment">;;  * `highlight-chars.el' - Provides ways to highlight different sets</span>
<span class="comment">;;    of characters, including whitespace and Unicode characters.  It</span>
<span class="comment">;;    is available here:</span>
<span class="comment">;;    http://www.emacswiki.org/highlight-chars.el              (code)</span>
<span class="comment">;;    http://www.emacswiki.org/ShowWhiteSpace#HighlightChars   (doc)</span>
<span class="comment">;;</span>
<span class="comment">;;  * `hi-lock.el' - The features of `highlight.el' are complementary</span>
<span class="comment">;;    to those of vanilla Emacs library `hi-lock.el', so you can use</span>
<span class="comment">;;    the two libraries together.  See this page for a comparison:</span>
<span class="comment">;;    http://www.emacswiki.org/HighlightTemporarily.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Commands That Won't Work in Emacs 20"</span>)</span>
<span class="comment">;;  ** Commands That Won't Work in Emacs 20 **</span>
<span class="comment">;;</span>
<span class="comment">;;  The following commands and options work only for Emacs versions</span>
<span class="comment">;;  more recent than Emacs 20:</span>
<span class="comment">;;</span>
<span class="comment">;;  `<span class="constant important">hlt-act-on-any-face-flag</span>', `<span class="constant important">hlt-hide-default-face</span>',</span>
<span class="comment">;;  `<span class="constant important">hlt-highlight-property-with-value</span>', `<span class="constant important">hlt-next-highlight</span>',</span>
<span class="comment">;;  `<span class="constant important">hlt-previous-highlight</span>', `<span class="constant important">hlt-show-default-face</span>',</span>
<span class="comment">;;  `<span class="constant important">hlt-toggle-act-on-any-face-flag</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"To Do"</span>)</span>
<span class="comment">;;  ** To Do **</span>
<span class="comment">;;</span>
<span class="comment">;;  1. Add commands to show and hide boolean combinations of faces.</span>
<span class="comment">;;</span>
<span class="comment">;;  2. Faces are not accumulated as text properties.</span>
<span class="comment">;;     Highlighting with one face completely replaces the previous</span>
<span class="comment">;;     highlight.  Overlays don't have this limitation.  Text</span>
<span class="comment">;;     properties need not have it either, but they do, for now.</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Acknowledgement"</span>)</span>
<span class="comment">;;  **  Acknowledgement **</span>
<span class="comment">;;</span>
<span class="comment">;;  Some parts of this library were originally based on a library of</span>
<span class="comment">;;  the same name written and copyrighted by Dave Brennan,</span>
<span class="comment">;;  brennan@hal.com, in 1992.  I haven't been able to locate that</span>
<span class="comment">;;  file, so my change log is the only record I have of what our</span>
<span class="comment">;;  relative contributions are.</span>
 
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;;; Change Log:</span>
<span class="comment">;;</span>
<span class="comment">;;(@* <span class="string">"Change log"</span>)</span>
<span class="comment">;;</span>
<span class="comment">;; 2014/02/25 dadams</span>
<span class="comment">;;     Added: hlt-highlight-symbol, hlt-unhighlight-symbol.</span>
<span class="comment">;;     hlt-+/--highlight-regexp-region: Prevent doing hlt-next-face more than once.</span>
<span class="comment">;;     hlt-next-highlight: Interactive spec uses face at point if hlt-auto-faces-flag.</span>
<span class="comment">;;                         Use get-char-property, not get-text-property.</span>
<span class="comment">;;                         Wrap around.</span>
<span class="comment">;;     Bind C-x X hs, C-x X us to hlt-(un)highlight-symbol.</span>
<span class="comment">;; 2014/02/19 dadams</span>
<span class="comment">;;     hlt-+/--highlight-regexp-region:</span>
<span class="comment">;;       If UNHIGHLIGHTP: Do not advance to hlt-next-face.</span>
<span class="comment">;;                        If FACE is nil, unhighlight for all faces.</span>
<span class="comment">;; 2014/02/06 dadams</span>
<span class="comment">;;     hlt-+/--highlight-regexp-region: When hlt-auto-faces-flag, cycle to next face.</span>
<span class="comment">;; 2013/11/28 dadams</span>
<span class="comment">;;     Renamed hlt-read-face-name to hlt-read-bg/face-name, and rewrote:</span>
<span class="comment">;;       Added optional DEFAULT arg, read also color names.  No longer use read-face-name.</span>
<span class="comment">;;       (So no longer soft-require faces+.el.)</span>
<span class="comment">;;     hlt-choose-default-face: Read color names also.</span>
<span class="comment">;;     hlt-eraser, hlt-highlighter: Added optional arg FACE-NB.  Show message.</span>
<span class="comment">;;     hlt-highlight-region: If hlt-auto-faces-flag, use hlt-next-face.</span>
<span class="comment">;; 2013/11/24 dadams</span>
<span class="comment">;;     Use equal, not eq, for face comparisons, since the value could be a property list.</span>
<span class="comment">;; 2013/11/15 dadams</span>
<span class="comment">;;     Added: hlt-unhighlight-regexp-region, hlt-unhighlight-regexp-to-end,</span>
<span class="comment">;;            hlt-+/--highlight-regexp-read-args, hlt-+/--highlight-regexp-region,</span>
<span class="comment">;;            hlt-read-face-name.</span>
<span class="comment">;;     hlt-highlight-regexp-(region|to-end):</span>
<span class="comment">;;       Use hlt-+/--highlight-regexp-read-args and hlt-+/--highlight-regexp-region.</span>
<span class="comment">;;     hlt-highlight: Change use of prefix arg.  Include hlt-unhighlight-regexp-region.</span>
<span class="comment">;; 2013/11/07 dadams</span>
<span class="comment">;;     Added: hlt-highlight-enclosing-list.</span>
<span class="comment">;; 2013/09/15 dadams</span>
<span class="comment">;;     Soft-require font-lock+.el (Emacs 22+).</span>
<span class="comment">;; 2013/07/24 dadams</span>
<span class="comment">;;     Added: hlt-nonempty-region-p.</span>
<span class="comment">;;     Renamed: Paste Text Properties to * to Region, except in menu-bar-edit-region-menu.</span>
<span class="comment">;;     Wherever hlt-yank-props is used in menus:</span>
<span class="comment">;;       Enable only if hlt-nonempty-region-p and hlt-copied-props.</span>
<span class="comment">;;     hlt-highlight-region, hlt-highlight-property-with-value:</span>
<span class="comment">;;       Use hlt-nonempty-region-p, not just mark-active.</span>
<span class="comment">;;     hlt-yank-props, hlt-region-or-buffer-limits: Use hlt-nonempty-region-p.</span>
<span class="comment">;; 2013/05/28 dadams</span>
<span class="comment">;;     Require easymenu.el.</span>
<span class="comment">;;     hlt-highlighter, hlt-eraser: Wrap with with-current-buffer.  Thx to Michael Heerdegen.</span>
<span class="comment">;; 2012/07/11 dadams</span>
<span class="comment">;;     hlt-(highlighter|eraser)-mouse: Skip over event of choosing menu item, for Emacs 20-21.</span>
<span class="comment">;; 2011/12/01 dadams</span>
<span class="comment">;;     hlt-eraser: Fixed so it works backwards too.  Thx to Michael Heerdegen.</span>
<span class="comment">;;     hlt-unhighlight-region, hlt-replace-highlight-face, hlt-eraser: Use dolist, not mapcar.</span>
<span class="comment">;; 2011/11/04 dadams</span>
<span class="comment">;;     hlt-default-copy/yank-props: Allow a value of t, for all props.</span>
<span class="comment">;;     hlt-props-to-copy/yank: Handle t value of hlt-default-copy/yank-props.</span>
<span class="comment">;; 2011/10/31 dadams</span>
<span class="comment">;;     hlt-highlight-regexp-region: No occurrences msg if no match, not msg how to unhighlight.</span>
<span class="comment">;; 2011/09/13 dadams</span>
<span class="comment">;;     hlt-highlight-property-with-value: Corrected interactive spec for VALUES.</span>
<span class="comment">;; 2011/07/24 dadams</span>
<span class="comment">;;     Moved to icicles-cmd2.el, renamed with prefix icicle- from hlt-, and corrected them:</span>
<span class="comment">;;       hlt-(hide|show)(-only)-faces, hlt-choose(-(in)visible)-faces.</span>
<span class="comment">;;     menu-bar-edit-menu, facemenu(-mouse)-menu: Added hlt-(copy|yank)-props.</span>
<span class="comment">;; 2011/07/23 dadams</span>
<span class="comment">;;     Added: hlt-((mouse-)copy|yank|paste)-props, hlt-copied-props, hlt-subplist,</span>
<span class="comment">;;            hlt-default-copy/yank-props, hlt-read-props-completing, hlt-props-to-copy/yank.</span>
<span class="comment">;;     Added defgroup.  Updated defcustom/defface to use <span class="builtin">:group</span> highlight.</span>
<span class="comment">;;     menu-bar-edit-region-menu: Added hlt-yank-props, hlt-unhighlight-region-for-face.</span>
<span class="comment">;;                                Removed needing region for highlighting enablement.</span>
<span class="comment">;; 2011/05/05 dadams</span>
<span class="comment">;;     icicle-delete-if(-not) -&gt; icicle-remove-if(-not).  Former are obsolete.</span>
<span class="comment">;;     hlt-hide-default-face, hlt-next-highlight: Use also memq, not just eq, to test for face.</span>
<span class="comment">;; 2011/01/04 dadams</span>
<span class="comment">;;     Removed autoload cookies from non def* sexps and non-interactive functions.</span>
<span class="comment">;;     Added some missing autoload cookies for commands.</span>
<span class="comment">;; 2010/11/26 dadams</span>
<span class="comment">;;     Added: hlt-unhighlight-for-overlay.</span>
<span class="comment">;;     hlt-eraser, hlt-unhighlight-region:</span>
<span class="comment">;;       Use hlt-unhighlight-for-overlay, not hlt-delete-highlight-overlay.</span>
<span class="comment">;;     hlt-eraser: Update doc string to reflect new behavior.</span>
<span class="comment">;; 2009/09/24 dadams</span>
<span class="comment">;;     Removed hlt-no-op - use function ignore instead.</span>
<span class="comment">;; 2009/08/02 dadams</span>
<span class="comment">;;     Added: hlt(-mouse)-toggle-(link|property)-highlighting, hlt-(un)highlight-all-prop,</span>
<span class="comment">;;            hlt-property-highlight, hlt-prop-highlighting-state.</span>
<span class="comment">;; 2009/07/31 dadams</span>
<span class="comment">;;     Added: hlt-highlight-property-with-value, hlt-flat-list, hlt-set-intersection.</span>
<span class="comment">;; 2009/04/26 dadams</span>
<span class="comment">;;     hlt-mouse-face-each-line: Bind inhibit-field-text-motion to  t, for real eol.</span>
<span class="comment">;; 2008/01/17 dadams</span>
<span class="comment">;;     Removed soft require of icicles.el.</span>
<span class="comment">;; 2007/11/27 dadams</span>
<span class="comment">;;     hlt-highlight-regexp-region: If available, use icicle-read-string-completing.</span>
<span class="comment">;; 2007/08/12 dadams</span>
<span class="comment">;;     Moved here from menu-bar+.el: Add to Edit&gt;Region menu.  Soft require menu-bar.el.</span>
<span class="comment">;; 2007/06/07 dadams</span>
<span class="comment">;;     Use face-name-history or icicle-face-name-history, if defined, else face-name-history.</span>
<span class="comment">;; 2007/06/05 dadams</span>
<span class="comment">;;     Added: hlt-(highlighter|eraser)-mouse.</span>
<span class="comment">;; 2007/06/04 dadams</span>
<span class="comment">;;     Added: hlt-previous-use-overlays-flag-value.</span>
<span class="comment">;;     hlt-use-overlays-flag: 3 values now; default is only.</span>
<span class="comment">;;     hlt-eraser, hlt-unhighlight-region, hlt-hide-default-face, hlt-next-highlight:</span>
<span class="comment">;;       Treat non-only, non-nil hlt-use-overlays-flag.</span>
<span class="comment">;;     hlt-toggle-use-overlays-flag: Use hlt-previous-use-overlays-flag-value.</span>
<span class="comment">;;     Updated doc.</span>
<span class="comment">;; 2007/06/03 dadams</span>
<span class="comment">;;     Added: hlt-toggle-use-overlays-flag.</span>
<span class="comment">;;     Don't even define hlt-act-on-any-face-flag for Emacs 20.</span>
<span class="comment">;;     Renamed no-op to hlt-no-op. Removed soft require of misc-cmds.el.</span>
<span class="comment">;; 2007/06/02 dadams</span>
<span class="comment">;;     Added: hlt-act-on-any-face-flag, hlt-add-listifying, hlt-add-to-invisibility-spec,</span>
<span class="comment">;;            hlt-choose(-(in)visible)-faces, hlt-(hide|show)(-default-face|-only),</span>
<span class="comment">;;            hlt-highlight-faces-in-buffer, hlt-set-union, hlt-toggle-act-on-any-face-flag.</span>
<span class="comment">;;     Renamed: highlight-use-overlays-flag to hlt-use-overlays-flag,</span>
<span class="comment">;;              highlight-max-region-no-warning to hlt-max-region-no-warning,</span>
<span class="comment">;;              highlight-last-regexp to hlt-last-regexp, highlight-last-face to hlt-last-face,</span>
<span class="comment">;;              highlight-face to hlt-choose-default-face,</span>
<span class="comment">;;              highlight-highlighter to hlt-highlighter, highlight-eraser to hlt-eraser,</span>
<span class="comment">;;              mouse-face-each-line to hlt-mouse-face-each-line,</span>
<span class="comment">;;              unhighlight-region(-for-face) to hlt-unhighlight-region(-for-face).</span>
<span class="comment">;;     hlt-highlighter, hlt-highlight-region, hlt-mouse-face-each-line:</span>
<span class="comment">;;       Also put face as hlt-highlight property.</span>
<span class="comment">;;     hlt-eraser: Also remove hlt-highlight property.</span>
<span class="comment">;;     hlt-highlight-region, hlt-unhighlight-region, hlt-replace-highlight-face,</span>
<span class="comment">;;       hlt-next-highlight, hlt-mouse-face-each-line, hlt-highlight-regexp-region:</span>
<span class="comment">;;         Made start, end, and regexp args optional too.  Default for non-interactive too.</span>
<span class="comment">;;     hlt-unhighlight-region-for-face: Made all args optional.  Default them.</span>
<span class="comment">;;     hlt-unhighlight-region: Only remove highlighting for FACE, not all faces.</span>
<span class="comment">;;     hlt-highlight-single-quotations: Update hlt-last-face.</span>
<span class="comment">;;     hlt-next-highlight:</span>
<span class="comment">;;       Respect hlt-act-on-any-face-flag.  Return a cons of the limits.  Added no-error-p arg.</span>
<span class="comment">;;     hlt-previous-highlight: Added no-error-p arg.</span>
<span class="comment">;;     Added soft require of Icicles.</span>
<span class="comment">;; 2007/04/02 dadams</span>
<span class="comment">;;     Renamed highlight-region-beg-end to highlight-region-or-buffer-limits.</span>
<span class="comment">;; 2007/03/25 dadams</span>
<span class="comment">;;     highlight-highlighter, highlight-eraser, highlight-region, unhighlight-region:</span>
<span class="comment">;;       Use font-lock-ignore property.</span>
<span class="comment">;;     highlight-regexp-*: Use hi-lock-regexp-history or regexp-history.</span>
<span class="comment">;; 2007/03/23 dadams</span>
<span class="comment">;;     highlight-region:</span>
<span class="comment">;;       If no region and no overlay, apply face to next char typed &amp; add to facemenu menu.</span>
<span class="comment">;;     highlight-highlighter: Don't create overlay unless highlight-use-overlays-flag.</span>
<span class="comment">;;     highlight-highlighter, highlight-region, highlight-eraser:</span>
<span class="comment">;;       Don't bother to call font-lock-after-fontify-buffer.</span>
<span class="comment">;;     highlight-highlighter, highlight-region: Prepare for possible font-lock-ignore prop.</span>
<span class="comment">;;     highlight: Removed message.</span>
<span class="comment">;; 2007/03/20 dadams</span>
<span class="comment">;;     highlight-face: Add face as arg.  Added final message.</span>
<span class="comment">;; 2007/03/17 dadams</span>
<span class="comment">;;     Added: highlight-(next|previous)-highlight, highlight-region-beg-end,</span>
<span class="comment">;;            highlight-eraser.</span>
<span class="comment">;;     highlight-region, highlight-regexp-to-end, highlight-regexp-region:</span>
<span class="comment">;;       Interactively, use highlight-last-face as the face.</span>
<span class="comment">;;     highlight-single-quotations: Added prefix arg, meaning prompt for face.</span>
<span class="comment">;;     highlight-region, highlight-regexp-region, unhighlight-region(-for-face),</span>
<span class="comment">;;     *-replace-face, *-single-quotations: If no region, then use whole buffer.</span>
<span class="comment">;;     highlight-single-quotations:</span>
<span class="comment">;;       Use highlight-regexp-region, not highlight-regexp-to-end.  Msg if interactive.</span>
<span class="comment">;;     highlight-regexp-region: Ensure move past match in loop.  Face is optional now.</span>
<span class="comment">;;     mouse-face-each-line: Added args start, end, face, msg-p. Restrict to region.</span>
<span class="comment">;;     Removed: mouse-face-following-lines.</span>
<span class="comment">;;     highlight-region: Added msg-p arg and progress message.</span>
<span class="comment">;;     unhighlight-region, highlight-replace-face: Simple message, no where part.</span>
<span class="comment">;;     unhighlight-region: Changed order of optional args, for consistency.</span>
<span class="comment">;;     highlight-highlighter:</span>
<span class="comment">;;       Make overlay once, and move it.  Initialize end-point to start-point.</span>
<span class="comment">;; 2007/03/16 dadams</span>
<span class="comment">;;     Renamed highlight-regexp to highlight-regexp-to-end, because Emacs now uses that name.</span>
<span class="comment">;;     Renamed max-highlight-w-o-warning to highlight-max-region-no-warning.</span>
<span class="comment">;;     Added: highlight-use-overlays-flag, highlight-last-face, highlight-face,</span>
<span class="comment">;;            highlight-highlighter, unhighlight-region-for-face,</span>
<span class="comment">;;            highlight-replace-face, highlight-delete-overlay.</span>
<span class="comment">;;     highlight-single-quotations: Read the face name.</span>
<span class="comment">;;     highlight-single-quotations, highlight-region, highlight-regexp-to-end,</span>
<span class="comment">;;     highlight-regexp-region: Set highlight-last-face.</span>
<span class="comment">;;     unhighlight-region, highlight-region, mouse-face-following-lines,</span>
<span class="comment">;;     mouse-face-each-line: Respect highlight-use-overlays-flag.</span>
<span class="comment">;;     unhighlight-region, mouse-face-*: Added optional face arg.</span>
<span class="comment">;;     highlight-max-region-no-warning: defvar -&gt; defcustom.</span>
<span class="comment">;;     highlight-regexp-region: Use mouse-p when call highlight-region.</span>
<span class="comment">;; 2006/03/31 dadams</span>
<span class="comment">;;     No longer use display-in-minibuffer.</span>
<span class="comment">;; 2005/12/18 dadams</span>
<span class="comment">;;     Use minibuffer-prompt face.  Removed require of def-face-const.el.</span>
<span class="comment">;;     highlight-single-quotations: defsubst -&gt; defun.</span>
<span class="comment">;; 2004/10/13 dadams</span>
<span class="comment">;;     Updated for Emacs 21: highlight-region: Bind</span>
<span class="comment">;;       inhibit-modification-hooks to non-nil to prevent Emacs 21</span>
<span class="comment">;;       font-lock from refontifying (removing highlighting)</span>
<span class="comment">;; 2004/10/12 dadams</span>
<span class="comment">;;     highlight-region: Use font-lock-after-fontify-buffer instead of</span>
<span class="comment">;;       lazy-lock-after-fontify-buffer.</span>
<span class="comment">;; 2004/03/16 dadams</span>
<span class="comment">;;     highlight-region: Prevent put-text-property from removing highlighting</span>
<span class="comment">;; 1996/04/26  dadams</span>
<span class="comment">;;     Put escaped newlines on long-line strings.</span>
<span class="comment">;; 1996/04/25  dadams</span>
<span class="comment">;;     1. Added highlight-single-quotations.</span>
<span class="comment">;;     2. highlight-regexp, highlight-regexp-region: Added new optional arg NTH.</span>
<span class="comment">;; 1996/04/25  dadams</span>
<span class="comment">;;     Added mouse-face-following-lines.</span>
<span class="comment">;; 1996/04/04  dadams</span>
<span class="comment">;;     1. highlight: Removed RAW-PREFIX, DISPLAY-MSGS args.  Made PREFIX optional.</span>
<span class="comment">;;        Set current-prefix-arg to nil so called fns don't use it as mouse-p.</span>
<span class="comment">;;     2. highlight-regexp, highlight-regexp-region: Added MOUSE-P arg.</span>
<span class="comment">;; 1996/02/27  dadams</span>
<span class="comment">;;     Added mouse-face-each-line.</span>
<span class="comment">;; 1996/02/26  dadams</span>
<span class="comment">;;     unhighlight-region: Added new arg MOUSE-P.</span>
<span class="comment">;; 1996/02/12  dadams</span>
<span class="comment">;;     highlight-region: Added optional arg MOUSE-P.</span>
<span class="comment">;; 1996/02/06  dadams</span>
<span class="comment">;;     Put variable-interactive property on appropriate user option vars.</span>
<span class="comment">;; 1996/02/01  dadams</span>
<span class="comment">;;     highlight: Just call subfunctions interactively.</span>
<span class="comment">;;     highlight-region, highlight-regexp, highlight-regexp-region: Use</span>
<span class="comment">;;       read-face-name</span>
<span class="comment">;; 1996/01/08  dadams</span>
<span class="comment">;;     highlight-regexp, highlight-regexp-region: message -&gt; display-in-minibuffer.</span>
<span class="comment">;; 1995/11/09  dadams</span>
<span class="comment">;;     highlight-region: FACE arg is optional.</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="comment">;; it under the terms of the GNU General Public License as published by</span>
<span class="comment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="comment">;; any later version.</span>

<span class="comment">;; This program is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="comment">;; GNU General Public License for more details.</span>

<span class="comment">;; You should have received a copy of the GNU General Public License</span>
<span class="comment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="comment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="comment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;;; Code:</span>

(<span class="keyword">require</span> '<span class="constant">easymenu</span>) <span class="comment">;; easy-menu-add-item</span>
(<span class="keyword">require</span> '<span class="constant">frame-fns</span> nil t) <span class="comment">;; (no error if not found): flash-ding</span>
(<span class="keyword">require</span> '<span class="constant">menu-bar+</span> nil t) <span class="comment">;; (no error if not found): menu-bar-edit-region-menu</span>
(<span class="keyword cl">when</span> (&gt; emacs-major-version 21) (<span class="keyword">require</span> '<span class="constant">font-lock+</span> nil t)) <span class="comment">;; (no error if not found)</span>
<span class="comment">;; (<span class="keyword">require</span> '<span class="constant">icicles</span> nil t)   ;; (no error if not found): icicle-define-command,</span>
                              <span class="comment">;; icicle-face-name-history, icicle-make-face-candidate,</span>
                              <span class="comment">;; icicle-read-string-completing, icicle-remove-if,</span>
                              <span class="comment">;; icicle-remove-if-not.</span>

<span class="comment">;; Quiet the byte-compiler for Emacs 20</span>
(<span class="keyword">defvar</span> <span class="variable">hi-lock-mode</span>)
(<span class="keyword">defvar</span> <span class="variable">hlt-act-on-any-face-flag</span>)
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>


 
<span class="comment">;;(@* <span class="string">"Key Bindings"</span>)</span>

<span class="comment">;;; Key Bindings -----------------------------------------------------</span>

(<span class="keyword">defvar</span> <span class="variable">hlt-map</span> nil <span class="string">"Keymap containing bindings for highlighting commands."</span>)

(define-prefix-command 'hlt-map)
(define-key ctl-x-map <span class="string">"X"</span> hlt-map)

(define-key hlt-map [(down-mouse-2)]            'hlt-highlighter)
(define-key hlt-map [(S-down-mouse-2)]          'hlt-eraser)
(define-key hlt-map [(C-S-down-mouse-2)]        'hlt-copy-props)
(define-key hlt-map [(C-S-mouse-2)]             'ignore)
(define-key hlt-map [(C-down-mouse-2)]          'hlt-yank-props)
(define-key hlt-map [(C-mouse-2)]               'ignore)
(define-key hlt-map [(down-mouse-1)]            'hlt-mouse-copy-props)
(define-key hlt-map <span class="string">"\C-\M-s"</span>                   'hlt-highlight-enclosing-list)
(define-key hlt-map <span class="string">"\M-w"</span>                      'hlt-copy-props)
(define-key hlt-map <span class="string">"\C-y"</span>                      'hlt-yank-props)
(define-key hlt-map <span class="string">"c"</span>                         'hlt-choose-default-face)
(define-key hlt-map <span class="string">"n"</span>                         'hlt-next-face)
(define-key hlt-map <span class="string">"p"</span>                         'hlt-previous-face)
(define-key hlt-map <span class="string">"r"</span>                         'hlt-replace-highlight-face)

(define-key hlt-map <span class="string">"h"</span>                         nil) <span class="comment">; Prefix key</span>
(define-key hlt-map <span class="string">"hh"</span>                        'hlt-highlight)
(define-key hlt-map <span class="string">"hr"</span>                        'hlt-highlight-region)
(define-key hlt-map <span class="string">"hs"</span>                        'hlt-highlight-symbol)
(define-key hlt-map <span class="string">"hx"</span>                        'hlt-highlight-regexp-region)
(define-key hlt-map <span class="string">"he"</span>                        'hlt-highlight-regexp-to-end)
(define-key hlt-map <span class="string">"u"</span>                         nil) <span class="comment">; Prefix key</span>
(define-key hlt-map <span class="string">"ur"</span>                        'hlt-unhighlight-region)
(define-key hlt-map <span class="string">"us"</span>                        'hlt-unhighlight-symbol)
(define-key hlt-map <span class="string">"ux"</span>                        'hlt-unhighlight-regexp-region)
(define-key hlt-map <span class="string">"ue"</span>                        'hlt-unhighlight-regexp-to-end)
(define-key hlt-map <span class="string">"uf"</span>                        'hlt-unhighlight-region-for-face)

(<span class="keyword cl">when</span> (&gt; emacs-major-version 20)        <span class="comment">; Emacs 21+</span>
  (define-key hlt-map <span class="string">"-"</span>                       'hlt-hide-default-face)
  (define-key hlt-map <span class="string">"+"</span>                       'hlt-show-default-face)
  (define-key hlt-map <span class="string">"t"</span>                       nil) <span class="comment">; Prefix key</span>
  (define-key hlt-map <span class="string">"to"</span>                      'hlt-toggle-use-overlays-flag)
  (define-key hlt-map <span class="string">"ta"</span>                      'hlt-toggle-act-on-any-face-flag)
  (define-key hlt-map <span class="string">"tp"</span>                      'hlt-toggle-property-highlighting)
  (define-key hlt-map <span class="string">"tl"</span>                      'hlt-toggle-link-highlighting)
  (define-key hlt-map [(shift control ?p)]      'hlt-previous-highlight)
  (define-key hlt-map [(shift control ?n)]      'hlt-next-highlight)
  (define-key hlt-map <span class="string">"hv"</span>                      'hlt-highlight-property-with-value)
  (define-key hlt-map <span class="string">"hp"</span>                      'hlt-highlight-all-prop)
  (define-key hlt-map <span class="string">"up"</span>                      'hlt-unhighlight-all-prop))
 
<span class="comment">;;(@* <span class="string">"Menus"</span>)</span>

<span class="comment">;;; Menu-Bar `<span class="constant important">Edit</span>' Menu ---------------------------------------------</span>

(<span class="keyword">defun</span> <span class="function">hlt-nonempty-region-p</span> ()
  <span class="string">"Return non-nil if region is active and non-empty."</span>
  (and transient-mark-mode  mark-active  (&gt; (region-end) (region-beginning))))

(define-key-after menu-bar-edit-menu [hlt-copy-props]
  '(menu-item <span class="string">"Copy Text Properties"</span> hlt-copy-props
    <span class="builtin">:help</span> <span class="string">"Copy text properties at point, for subsequent pasting"</span>) 'paste)
(define-key-after menu-bar-edit-menu [hlt-yank-props]
    '(menu-item <span class="string">"Paste Text Properties to Region"</span> hlt-yank-props
      <span class="builtin">:help</span> <span class="string">"Paste previously copied text properties to text in region"</span>
      <span class="builtin">:enable</span> (and (hlt-nonempty-region-p)  (not buffer-read-only)  hlt-copied-props))
    'hlt-copy-props)

<span class="comment">;;; Menu-Bar `<span class="constant important">Edit</span>' &gt; `<span class="constant important">Region</span>' Menu ----------------------------------</span>

(<span class="keyword cl">when</span> (boundp 'menu-bar-edit-region-menu) <span class="comment">; Defined in `menu-bar+.el'.</span>
  (define-key menu-bar-edit-region-menu [separator-highlight] '(<span class="string">"--"</span>))
  (define-key menu-bar-edit-region-menu [hlt-yank-props]
    '(menu-item <span class="string">"Paste Text Properties"</span> hlt-yank-props
      <span class="builtin">:help</span> <span class="string">"Paste previously copied text properties to text in region"</span>
      <span class="builtin">:enable</span> hlt-copied-props))
  (define-key menu-bar-edit-region-menu [hlt-unhighlight-region-for-face]
    '(menu-item <span class="string">"Unhighlight for Face..."</span> hlt-unhighlight-region-for-face
      <span class="builtin">:help</span> <span class="string">"Remove highlighting for a given face in the region"</span>))
  (define-key menu-bar-edit-region-menu [hlt-unhighlight-region]
    '(menu-item <span class="string">"Unhighlight"</span> hlt-unhighlight-region
      <span class="builtin">:help</span> <span class="string">"Remove highlighting (faces) in the region"</span>))
  (define-key menu-bar-edit-region-menu [hlt-highlight-regexp-region]
    '(menu-item <span class="string">"Highlight Regexp..."</span> hlt-highlight-regexp-region
      <span class="builtin">:help</span> <span class="string">"Highlight parts of region that match a regexp"</span>))
  (define-key menu-bar-edit-region-menu [hlt-highlight-region]
    '(menu-item <span class="string">"Highlight"</span> hlt-highlight-region
      <span class="builtin">:help</span> <span class="string">"Highlight all text in the region"</span>)))

<span class="comment">;;; Facemenu `Text Properties' Menu ----------------------------------</span>
(<span class="keyword cl">when</span> (boundp 'facemenu-mouse-menu)
  (easy-menu-add-item facemenu-mouse-menu ()
                      [<span class="string">"Paste Text Properties to Region"</span>
                       hlt-yank-props
                       (and (hlt-nonempty-region-p)  (not buffer-read-only)  hlt-copied-props)]
                      'dp)
  (easy-menu-add-item facemenu-mouse-menu ()
                      [<span class="string">"Copy Text Properties"</span> hlt-copy-props t] 'dp))
(easy-menu-add-item facemenu-menu ()
                    [<span class="string">"Paste Text Properties to Region"</span>
                     hlt-yank-props
                     (and (hlt-nonempty-region-p)  (not buffer-read-only)  hlt-copied-props)]
                    'dp)
(easy-menu-add-item facemenu-menu () [<span class="string">"Copy Text Properties"</span> hlt-copy-props t] 'dp)
 
<span class="comment">;;(@* <span class="string">"Variables and Faces"</span>)</span>

<span class="comment">;;; Variables and Faces ----------------------------------------------</span>

(<span class="keyword">defgroup</span> <span class="type">highlight</span> nil
  <span class="string">"Highlighting."</span>
  <span class="builtin">:prefix</span> <span class="string">"hlt-"</span> <span class="builtin">:group</span> 'editing <span class="builtin">:group</span> 'convenience <span class="builtin">:group</span> 'wp <span class="builtin">:group</span> 'faces
  <span class="builtin">:link</span> `(url-link <span class="builtin">:tag</span> <span class="string">"Send Bug Report"</span>
          ,(concat <span class="string">"mailto:"</span> <span class="string">"drew.adams"</span> <span class="string">"@"</span> <span class="string">"oracle"</span> <span class="string">".com?subject=\
highlight.el bug: \
<span class="type">&amp;body=Describe</span> bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions."</span>))
  <span class="builtin">:link</span> '(url-link <span class="builtin">:tag</span> <span class="string">"Download"</span> <span class="string">"http://www.emacswiki.org/highlight.el"</span>)
  <span class="builtin">:link</span> '(url-link <span class="builtin">:tag</span> <span class="string">"Description"</span> <span class="string">"http://www.emacswiki.org/HighLight"</span>)
  <span class="builtin">:link</span> '(emacs-commentary-link <span class="builtin">:tag</span> <span class="string">"Commentary"</span> <span class="string">"highlight"</span>))

<span class="comment">;; This is defined in `faces.el', Emacs 22.  This definition is adapted to Emacs 20.</span>
(<span class="keyword cl">unless</span> (facep 'minibuffer-prompt)
  (<span class="keyword">defface</span> <span class="variable">minibuffer-prompt</span> '((((background dark)) (<span class="builtin">:foreground</span> <span class="string">"cyan"</span>))
                               (t (<span class="builtin">:foreground</span> <span class="string">"dark blue"</span>)))
    <span class="string">"*Face for minibuffer prompts."</span>
    <span class="builtin">:group</span> 'basic-faces))

(<span class="keyword">defun</span> <span class="function">hlt-remove-if-not</span> (pred xs)
  <span class="string">"A copy of list XS with only elements that satisfy predicate PRED."</span>
  (<span class="keyword elisp">let</span> ((result  ()))
    (<span class="keyword cl">dolist</span> (x xs) (<span class="keyword cl">when</span> (funcall pred x) (push x result)))
    (nreverse result)))

(<span class="keyword">defun</span> <span class="function">hlt-tty-colors</span> ()
  <span class="string">"Colors available for use with Emacs in a terminal (`emacs -nw')."</span>
  (hlt-remove-if-not #'x-color-defined-p
                     (<span class="keyword elisp">if</span> (fboundp 'tty-color-alist)
                         (mapcar #'car (tty-color-alist))
                       '(<span class="string">"blue"</span> <span class="string">"green"</span> <span class="string">"cyan"</span> <span class="string">"red"</span> <span class="string">"magenta"</span> <span class="string">"brown"</span> <span class="string">"lightgray"</span> <span class="string">"darkgray"</span>
                         <span class="string">"yellow"</span> <span class="string">"white"</span> <span class="string">"lightblue"</span> <span class="string">"lightgreen"</span> <span class="string">"lightcyan"</span> <span class="string">"lightred"</span>
                         <span class="string">"lightmagenta"</span>))))

(<span class="keyword">defcustom</span> <span class="variable">hlt-auto-face-backgrounds</span>
  (<span class="keyword elisp">let</span> ((tty-cols   (hlt-tty-colors))
        (tty-faces  (hlt-remove-if-not #'facep '(highlight isearch isearch-fail lazy-highlight
                                                 mode-line mode-line-inactive next-error
                                                 nobreak-space secondary-selection tooltip
                                                 trailing-whitespace))))
    (<span class="keyword elisp">if</span> (<span class="keyword elisp">if</span> (fboundp 'display-graphic-p) (display-graphic-p) window-system)
        (append tty-cols  '(<span class="string">"DeepPink"</span> <span class="string">"MediumPurple1"</span> <span class="string">"SpringGreen1"</span> <span class="string">"DarkOrange"</span> <span class="string">"HotPink1"</span>)
                tty-faces (hlt-remove-if-not #'facep '(header-line mode-line-highlight)))
      (append tty-cols tty-faces)))
  <span class="string">"*Colors or faces rotated among for the next highlighting face.
A face specifies the face to use.

A color name or RGB hex string specifies only the background color to
use.  The foreground color is then determined by option
`<span class="constant important">hlt-auto-face-foreground</span>'.

This option has no effect if option `<span class="constant important">hlt-auto-faces-flag</span>' is nil."</span>
  <span class="builtin">:type</span> '(repeat (choice
                  (color <span class="builtin">:tag</span> <span class="string">"Background color"</span> <span class="builtin">:value</span> <span class="string">"yellow"</span>)
                  (face  <span class="builtin">:tag</span> <span class="string">"Face"</span> <span class="builtin">:value</span> <span class="string">"highlight"</span>)))
  <span class="builtin">:group</span> 'highlight)

(<span class="keyword">defcustom</span> <span class="variable">hlt-auto-face-foreground</span> nil
  <span class="string">"*Foreground color for pseudo faces created from a chosen background.
The value is either a color (name or #RGB hex triplet) or nil.  A nil
value means that highlighting does not change the existing foreground
color."</span>
  <span class="builtin">:type</span> '(choice
          color
          (const <span class="builtin">:tag</span> <span class="string">"Unspecified: respect current foreground"</span> nil))
  <span class="builtin">:group</span> 'highlight)

(<span class="keyword">defcustom</span> <span class="variable">hlt-auto-faces-flag</span> nil
    <span class="string">"*Non-nil means highlighting can automatically choose faces.
Highlighting action can use the next background color or face in
`<span class="constant important">hlt-auto-face-backgrounds</span>'.  When a given item in the list is a color
name, not a face, `<span class="constant important">hlt-auto-face-foreground</span>' is used as the
corresponding foreground.

This option has no effect on unhighlighting."</span>
    <span class="builtin">:type</span> 'boolean <span class="builtin">:group</span> 'highlight)

(<span class="keyword cl">when</span> (fboundp 'next-single-char-property-change) <span class="comment">; Don't bother, for Emacs 20.</span>
  (<span class="keyword">defface</span> <span class="variable">hlt-property-highlight</span> '((((background dark)) (<span class="builtin">:background</span> <span class="string">"Navy"</span>))
                                    (t (<span class="builtin">:background</span> <span class="string">"Wheat"</span>)))
    <span class="string">"*Face used to highlight all links."</span>
    <span class="builtin">:group</span> 'highlight <span class="builtin">:group</span> 'faces)
  (<span class="keyword">defcustom</span> <span class="variable">hlt-act-on-any-face-flag</span> nil
    <span class="string">"*Non-nil means highlight actions apply to all text with a face.
nil means that they apply only to text that has been highlighted.
Consult the doc for particular actions, to see if they are affected by
this option."</span>
    <span class="builtin">:type</span> 'boolean <span class="builtin">:group</span> 'highlight)

  (<span class="keyword">defvar</span> <span class="variable">hlt-prop-highlighting-state</span> '(nil . nil)
    <span class="string">"Cons representing the state of property highlighting.
The car indicates whether property highlighting is on (nil means off).
The cdr is the position of the last mouse click that changed state, as
a marker."</span>))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defcustom</span> <span class="variable">hlt-max-region-no-warning</span> 100000
  <span class="string">"*Maximum size (chars) of region to highlight without confirmation.
This is used only for highlighting of a regexp, which can be slow."</span>
  <span class="builtin">:type</span> 'integer <span class="builtin">:group</span> 'highlight)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defcustom</span> <span class="variable">hlt-use-overlays-flag</span> 'only
  <span class="string">"*Non-nil means use overlays to highlight<span class="comment">; nil means use text properties.</span>
This value also affects some actions, such as unhighlighting, for text
that is highlighted.  If the value is `<span class="constant important">only</span>' (<span class="keyword cl">the</span> default value), then
those actions only affect overlay highlighting.  Otherwise, they
affect both kinds of highlighting."</span>
  <span class="builtin">:type</span> '(choice
          (const <span class="builtin">:tag</span> <span class="string">"Highlight using text properties, not overlays"</span> nil)
          (const <span class="builtin">:tag</span> <span class="string">"Highlight using overlays, not text properties"</span> only)
          (sexp  <span class="builtin">:tag</span>
           <span class="string">"Highlight using overlays, but act also on highlight text properties"</span> t))
  <span class="builtin">:group</span> 'highlight)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defcustom</span> <span class="variable">hlt-default-copy/yank-props</span> '(face)
  <span class="string">"*Properties that `<span class="constant important">hlt-copy-props</span>' and `<span class="constant important">hlt-yank-props</span>' use by default.
You can use a prefix argument with those commands to override the
default behavior.
Either a list of properties (symbols) or `<span class="constant important">t</span>', meaning all properties."</span>
  <span class="builtin">:type</span> '(choice
          (const <span class="builtin">:tag</span> <span class="string">"All properties"</span> t)
          (repeat (symbol <span class="builtin">:tag</span> <span class="string">"Property"</span>)))
  <span class="builtin">:group</span> 'highlight)

(<span class="keyword">defvar</span> <span class="variable">hlt-face-nb</span> 0 
  <span class="string">"Current index into `<span class="constant important">hlt-auto-face-backgrounds</span>'.
This variable is always buffer-local."</span>)
(make-variable-buffer-local 'hlt-face-nb)

(<span class="keyword">defvar</span> <span class="variable">hlt-last-face</span> 'highlight
  <span class="string">"The last face used by highlight commands.
The value can also be an alist with two entries:
\(`<span class="constant important">background-color</span>' . COLOR) and
\(`<span class="constant important">foreground-color</span>' . hlt-auto-face-foreground)."</span>)

(<span class="keyword">defvar</span> <span class="variable">hlt-last-regexp</span> nil <span class="string">"The last regexp highlighted."</span>)

(<span class="keyword">defvar</span> <span class="variable">hlt-previous-use-overlays-flag-value</span> nil <span class="string">"Previous value of `<span class="constant important">hlt-use-overlays-flag</span>'."</span>)

(<span class="keyword">defvar</span> <span class="variable">hlt-copied-props</span> ()
  <span class="string">"Plist of text properties last copied using `<span class="constant important">hlt-copy-props</span>'."</span>)
 
<span class="comment">;;(@* <span class="string">"Misc Functions - Emacs 20+"</span>)</span>

<span class="comment">;;; Misc Functions - Emacs 20+ ---------------------------------------</span>

(<span class="keyword">defun</span> <span class="function">hlt-read-bg/face-name</span> (prompt <span class="type">&amp;optional</span> default)
  <span class="string">"Read a face name or color name using completion.
A color name can also be a hex RGB triplet prefixed by `#'.
To allow this, completion is lax.

Prompt with PROMPT.
Optional arg DEFAULT is a face name used if the user enters nothing.

Return the corresponding face.  But if a color name is chosen then
return a face spec composed of the color name as `<span class="constant important">background-color</span>'
and the value of `<span class="constant important">hlt-auto-face-foreground</span>' as `<span class="constant important">foreground-color</span>'."</span>
  (<span class="keyword elisp">save-match-data</span> (<span class="keyword cl">when</span> (string-match <span class="string">"\\(:\\s *$\\|:?\\s +$\\)"</span> prompt)
                     (setq prompt  (substring prompt 0 (- (length (match-string 0 prompt)))))))
  (<span class="keyword cl">unless</span> default (setq default  (<span class="keyword elisp">if</span> (facep hlt-last-face)
                                     (symbol-name hlt-last-face)
                                   (and (consp hlt-last-face)
                                        (cdr (assq 'background-color hlt-last-face))))))
  (<span class="keyword cl">unless</span> (stringp default) (setq default  (format <span class="string">"%s"</span> default)))
  (<span class="keyword elisp">let</span> ((prompt                        (<span class="keyword elisp">if</span> default
                                           (format <span class="string">"%s (default `<span class="constant important">%s</span>'): "</span> prompt default)
                                         (format <span class="string">"%s: "</span> prompt)))
        (faces                         ())
        (completion-annotate-function  (<span class="keyword elisp">lambda</span> (fc)
                                         (<span class="keyword elisp">if</span> (facep (intern fc)) <span class="string">"  Face"</span> <span class="string">"  Color"</span>)))
        (colors                        (mapcar #'list (<span class="keyword elisp">if</span> window-system
                                                          (x-defined-colors)
                                                        (hlt-tty-colors)))))
    (mapatoms (<span class="keyword elisp">lambda</span> (sy) (<span class="keyword cl">when</span> (facep sy) (push (list (symbol-name sy)) faces))))
    (<span class="keyword elisp">let</span> ((bg/face  (completing-read prompt (append faces colors) nil nil <span class="comment">; Lax, to allow #RGB</span>
                                     nil 'face-name-history default)))
      (<span class="keyword elisp">if</span> (facep (intern bg/face))
          (intern bg/face)
        `((background-color . ,bg/face) (foreground-color . ,hlt-auto-face-foreground))))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-choose-default-face</span> (face)
  <span class="string">"Choose a face for highlighting.
Set `<span class="constant important">hlt-last-face</span>' to the face, and return it.

You can choose a face name or a color name.  If a color is chosen, it
is used for the face background.  The face foreground is determined by
the value of `<span class="constant important">hlt-auto-face-foreground</span>'."</span>
  (interactive
   (list (hlt-read-bg/face-name <span class="string">"Choose background color or face: "</span>
                                (and (symbolp hlt-last-face)  (symbol-name hlt-last-face)))))
  (setq hlt-last-face  face)
  (<span class="keyword cl">when</span> (interactive-p) (message <span class="string">"Highlighting will now use `<span class="constant important">%s</span>'"</span> face))
  face)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-next-face</span> (<span class="type">&amp;optional</span> face-nb msgp)
  <span class="string">"Choose the next face for highlighting and unhighlighting.
Use `<span class="constant important">hlt-auto-face-backgrounds</span>' and `<span class="constant important">hlt-auto-face-foreground</span>'.

A non-negative numeric prefix arg N means use the Nth entry of
`<span class="constant important">hlt-auto-face-backgrounds</span>'.  Counting is 0-based.

A negative numeric prefix arg N means count from the end, not the
beginning, of `<span class="constant important">hlt-auto-face-backgrounds</span>': -1 means the last entry, -2
means the next-to-last, etc. (counting from the end is 1-based, not
0-based).

From LISP, if the first argument is `<span class="constant important">previous</span>' then choose the
previous face, not the next one."</span>
  (interactive (list (and current-prefix-arg  (prefix-numeric-value current-prefix-arg))
                     t))
  (<span class="keyword elisp">let</span>* ((len      (length hlt-auto-face-backgrounds))
         (nb       -1)
         (nb       (and (not (integerp face-nb))
                        (<span class="keyword">catch</span> '<span class="constant">hlt-next-face</span>
                          (<span class="keyword elisp">let</span> ((last-bg/f  (<span class="keyword elisp">if</span> (facep hlt-last-face)
                                                hlt-last-face
                                              (cdr (assq 'background-color hlt-last-face)))))
                            (<span class="keyword cl">dolist</span> (bg/f  hlt-auto-face-backgrounds)
                              (setq nb  (1+ nb))
                              (<span class="keyword cl">when</span> (equal bg/f last-bg/f) (<span class="keyword">throw</span> '<span class="constant">hlt-next-face</span> nb))))
                          nil))))
    (setq hlt-face-nb    (mod (<span class="keyword elisp">if</span> nb
                                  (<span class="keyword elisp">if</span> (eq face-nb t) (1- nb) (1+ nb))
                                (or (and (integerp face-nb)  face-nb)  1))
                              len)
          hlt-last-face  (<span class="keyword elisp">let</span> ((bg/f  (nth hlt-face-nb hlt-auto-face-backgrounds)))
                           (<span class="keyword elisp">if</span> (facep bg/f)
                               bg/f 
                             `((background-color . ,bg/f)
                               (foreground-color . ,hlt-auto-face-foreground)))))
    (<span class="keyword cl">when</span> msgp (message <span class="string">"Highlighting will now use face `<span class="constant important">%s</span>'"</span> hlt-last-face))
    hlt-last-face))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-previous-face</span> (<span class="type">&amp;optional</span> face-nb msgp)
  <span class="string">"Like `<span class="constant important">hlt-next-face</span>', but previous, not next.
Use of a numeric prefix arg is the same as for `<span class="constant important">hlt-next-face</span>'."</span>
  (interactive (list (and current-prefix-arg  (prefix-numeric-value current-prefix-arg))
                     t))
  (hlt-next-face (<span class="keyword elisp">if</span> face-nb  (- face-nb) t) msgp))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-highlighter</span> (start-event <span class="type">&amp;optional</span> face-nb) <span class="comment">; Suggested binding: `C-x mouse-2'.</span>
  <span class="string">"Highlight the text you drag the mouse over.
The face used is the last face that was used for highlighting.
You can use command `<span class="constant important">hlt-choose-default-face</span>' to choose the default
face to use.

If `<span class="constant important">hlt-auto-faces-flag</span>' is non-nil then this command cycles to the
next color/face.  This is the case even if you do not drag the
mouse (empty highlight).  A message tells you what the face is.

A numeric prefix arg N means use the face represented by the Nth entry
of `<span class="constant important">hlt-auto-face-backgrounds</span>' (uses `<span class="constant important">hlt-next-face</span>')."</span>
  (interactive <span class="string">"e\np"</span>)
  (<span class="keyword cl">when</span> (or hlt-auto-faces-flag  current-prefix-arg)
    (hlt-next-face (and current-prefix-arg  face-nb)))
  (<span class="keyword elisp">save-excursion</span>
    (run-hooks 'mouse-leave-buffer-hook) <span class="comment">; Let temporary modes like isearch turn off.</span>
    (<span class="keyword elisp">let</span>* ((original-window  (selected-window))
           (echo-keystrokes  0)
           (start-posn       (event-start start-event))
           (start-point      (posn-point start-posn))
           (end-point        start-point)
           (start-window     (posn-window start-posn)))
      (<span class="keyword elisp">with-current-buffer</span> (window-buffer start-window)
        (<span class="keyword elisp">let</span> ((read-only                          buffer-read-only)
              (modified-p                         (buffer-modified-p))
              (inhibit-modification-hooks         t)
              (overlay                            (and hlt-use-overlays-flag
                                                       (make-overlay start-point start-point)))
              <span class="comment">;; Otherwise, `<span class="constant important">put-text-property</span>' calls this, which would remove highlight.</span>
              (font-lock-fontify-region-function  'ignore)
              event)
          (setq buffer-read-only  nil)
          (<span class="keyword elisp">track-mouse</span>
            (<span class="keyword elisp">while</span> (<span class="keyword elisp">progn</span> (setq event  (read-event))
                          (or (mouse-movement-p event)
                              (memq (car-safe event) '(switch-frame select-window))))
              (<span class="keyword cl">unless</span> (memq (car-safe event) '(switch-frame select-window))
                (setq end-point  (posn-point (event-end event))))
              (<span class="keyword elisp">cond</span> (hlt-use-overlays-flag
                     (setq overlay  (move-overlay overlay start-point end-point))
                     (overlay-put overlay 'face          hlt-last-face)
                     (overlay-put overlay 'hlt-highlight hlt-last-face))
                    (t
                     (put-text-property start-point end-point 'face             hlt-last-face)
                     (put-text-property start-point end-point 'hlt-highlight    hlt-last-face)
                     (put-text-property start-point end-point 'font-lock-ignore t)
                     ))))
          (setq buffer-read-only  read-only)
          (set-buffer-modified-p modified-p)))))
  (message <span class="string">"Highlighted with face `<span class="constant important">%s</span>'"</span>hlt-last-face))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-eraser</span> (start-event <span class="type">&amp;optional</span> face-nb) <span class="comment">; Suggested binding: `C-x S-mouse-2'.</span>
  <span class="string">"Erase highlights that you click or drag the mouse over.
If `<span class="constant important">hlt-use-overlays-flag</span>' is non-nil, then remove overlay
highlighting for the last face that was used for highlighting.  (You
can use command `<span class="constant important">hlt-choose-default-face</span>' first to choose a different
face.)  

If `<span class="constant important">hlt-use-overlays-flag</span>' is not `<span class="constant important">only</span>', then remove text-property
highlighting for *ALL* faces (not just highlighting faces).  This
means, in particular, that a value of nil erases both overlays for the
last face and text properties for all faces.

With a numeric prefix arg N, if `<span class="constant important">hlt-use-overlays-flag</span>' is `<span class="constant important">only</span>',
erase the face represented by the Nth entry of
`<span class="constant important">hlt-auto-face-backgrounds</span>' (uses `<span class="constant important">hlt-next-face</span>')."</span>
  (interactive <span class="string">"e\np"</span>)
  (<span class="keyword cl">when</span> (and (eq 'only hlt-use-overlays-flag)
             (or hlt-auto-faces-flag  current-prefix-arg)
             face-nb)
    (hlt-next-face (and current-prefix-arg  face-nb)))
  (<span class="keyword elisp">save-excursion</span>
    (run-hooks 'mouse-leave-buffer-hook) <span class="comment">; Let temporary modes like isearch turn off.</span>
    (<span class="keyword elisp">let</span>* ((original-window  (selected-window))
           (echo-keystrokes  0)
           (start-posn       (event-start start-event))
           (start            (posn-point start-posn))
           (end              start)
           (start-window     (posn-window start-posn)))
      (<span class="keyword elisp">with-current-buffer</span> (window-buffer start-window)
        (<span class="keyword elisp">let</span> ((read-only                          buffer-read-only)
              (modified-p                         (buffer-modified-p))
              (inhibit-modification-hooks         t)
              <span class="comment">;; Otherwise, `<span class="constant important">put-text-property</span>' calls this, which removes highlight.</span>
              (font-lock-fontify-region-function  'ignore)
              event)
          (setq buffer-read-only  nil)
          (<span class="keyword elisp">track-mouse</span>
            (<span class="keyword elisp">while</span> (<span class="keyword elisp">progn</span> (setq event  (read-event))
                          (or (mouse-movement-p event)
                              (memq (car-safe event) '(switch-frame select-window))))
              (<span class="keyword cl">unless</span> (memq (car-safe event) '(switch-frame select-window))
                (<span class="keyword elisp">let</span> ((posn-point  (posn-point (event-end event))))
                  (setq end    (max end posn-point)
                        start  (min start posn-point))))
              (<span class="keyword cl">when</span> hlt-use-overlays-flag <span class="comment">; Erase overlay properties</span>
                (<span class="keyword cl">dolist</span> (ov  (overlays-in start end))
                  (hlt-unhighlight-for-overlay ov start end hlt-last-face)))
              (<span class="keyword cl">unless</span> (eq 'only hlt-use-overlays-flag) <span class="comment">; Erase text properties</span>
                (remove-text-properties
                 start end '(face nil hlt-highlight nil font-lock-ignore nil)))))
          (setq buffer-read-only  read-only)
          (set-buffer-modified-p modified-p)))))
  (message <span class="string">"Unhighlighted `<span class="constant important">%s</span>'"</span>hlt-last-face))

<span class="comment">;;; (<span class="keyword">defun</span> <span class="function">hlt-unhighlight-for-overlay</span> (overlay start end <span class="type">&amp;optional</span> face)</span>
<span class="comment">;;;   <span class="string">"Remove OVERLAY highlighting from START to END.</span>
<span class="comment">;;; Acts only on an OVERLAY that was created by library `<span class="constant important">highlight</span>'.</span>
<span class="comment">;;; If OVERLAY extends beyond the region from START to END, then replace</span>
<span class="comment">;;; it with two overlays: one that ends at START and the other that starts</span>
<span class="comment">;;; at END.  Otherwise, delete OVERLAY.</span>
<span class="comment">;;; Optional arg FACE is a face symbol.  If non-nil, then delete only</span>
<span class="comment">;;; overlays with that FACE."</span></span>
<span class="comment">;;;   (<span class="keyword elisp">let</span> ((oface   (overlay-get overlay 'hlt-highlight))</span>
<span class="comment">;;;         (ostart  (overlay-start overlay))</span>
<span class="comment">;;;         (oend    (overlay-end   overlay)))</span>
<span class="comment">;;;     (<span class="keyword cl">when</span> (and oface  (or (not face)  (equal face oface)))</span>
<span class="comment">;;;       (delete-overlay overlay)</span>
<span class="comment">;;;       (<span class="keyword cl">when</span> (&lt; ostart start) (hlt-highlight-region ostart start face))</span>
<span class="comment">;;;       (<span class="keyword cl">when</span> (&gt; oend end) (hlt-highlight-region end oend face)))))</span>

<span class="comment">;; This version has an implementation similar to `<span class="constant important">remove-overlays</span>' in Emacs 22+.</span>
(<span class="keyword">defun</span> <span class="function">hlt-unhighlight-for-overlay</span> (overlay start end <span class="type">&amp;optional</span> face)
  <span class="string">"Remove OVERLAY highlighting from START to END.
Acts only on an OVERLAY that was created by library `<span class="constant important">highlight</span>'.
OVERLAY might be moved or split or both.

Optional arg FACE is a face symbol.  If non-nil, then remove only
highlighting with that FACE."</span>
  <span class="comment">;; (overlay-recenter end)                ; Speed up loops over overlays.</span>
  (<span class="keyword cl">when</span> (&lt; end start) (setq start (<span class="keyword elisp">prog1</span> end (setq end start))))
  (<span class="keyword elisp">let</span> ((oface   (overlay-get overlay 'hlt-highlight))
        (ostart  (overlay-start overlay))
        (oend    (overlay-end   overlay)))
    (<span class="keyword cl">when</span> (and oface  (or (not face)  (equal face oface)))
      <span class="comment">;; Either push OVERLAY outside region or split it to exclude region</span>
      <span class="comment">;; or delete it (<span class="keyword elisp">if</span> it is entirely contained in region).</span>
      (<span class="keyword elisp">if</span> (&lt; ostart start)
          (<span class="keyword elisp">if</span> (&lt;= oend end)
              (move-overlay overlay ostart start)
            (move-overlay (copy-overlay overlay) ostart start)
            (move-overlay overlay end oend))
        (<span class="keyword elisp">if</span> (&gt; oend end)
            (move-overlay overlay end oend)
          (delete-overlay overlay))))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-highlighter-mouse</span> ()
  <span class="string">"Same as `<span class="constant important">hlt-highlighter</span>', but for binding to a menu item."</span>
  (interactive)
  (message <span class="string">"Drag mouse to highlight text"</span>) (sleep-for 1)
  (hlt-highlighter (<span class="keyword elisp">if</span> (&gt; emacs-major-version 21)
                       (read-event)
                     (read-event)       <span class="comment">; Emacs 20-21: Skip event of choosing menu item.</span>
                     (read-event))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-eraser-mouse</span> ()
  <span class="string">"Same as `<span class="constant important">hlt-eraser</span>', but for binding to a menu item."</span>
  (interactive)
  (message <span class="string">"Drag mouse over to erase highlighting"</span>) (sleep-for 1)
  (hlt-eraser (<span class="keyword elisp">if</span> (&gt; emacs-major-version 21)
                  (read-event)
                (read-event)            <span class="comment">; Emacs 20-21: Skip event of choosing menu item.</span>
                (read-event))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-highlight</span> (<span class="type">&amp;optional</span> prefix) <span class="comment">; Suggested binding: `C-x C-y'.</span>
  <span class="string">"Highlight or unhighlight.
If the region is not active or it is empty, then use the whole buffer.
The face used is the last face that was used for highlighting.
You can use command `<span class="constant important">hlt-choose-default-face</span>' to choose a different face.

This is several commands rolled into one, depending on the prefix arg:

* No prefix arg: highlight all text in region/buffer
* Plain prefix arg (`<span class="constant important">C-u</span>') or zero prefix arg (`C-0'): UNhighlight all
* Positive prefix arg (`C-1'): highlight regexp matches
* Negative prefix arg (`<span class="constant important">C--</span>'): UNhighlight regexp matches

You can also used the individual commands:

* `<span class="constant important">hlt-highlight-region</span>'          - same as no prefix arg
* `<span class="constant important">hlt-unhighlight-region</span>'        - same as `<span class="constant important">C-u</span>' or `C-0'
* `<span class="constant important">hlt-highlight-regexp-region</span>'   - same as `C-1'
* `<span class="constant important">hlt-unhighlight-regexp-region</span>' - same as `<span class="constant important">C--</span>'"</span>
  (interactive <span class="string">"P"</span>)
  (setq current-prefix-arg  nil)        <span class="comment">; No MOUSE-P for calls to individual cmds.</span>
  (<span class="keyword elisp">cond</span> ((not prefix) (call-interactively 'hlt-highlight-region))
        ((or (consp prefix)  (zerop (prefix-numeric-value prefix)))
         (<span class="keyword elisp">save-excursion</span> (call-interactively 'hlt-unhighlight-region)))
        ((&gt; (prefix-numeric-value prefix) 0)
         (call-interactively 'hlt-highlight-regexp-region))
        ((&lt; (prefix-numeric-value prefix) 0)
         (<span class="keyword elisp">save-excursion</span> (call-interactively 'hlt-unhighlight-regexp-region)))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-highlight-region</span> (<span class="type">&amp;optional</span> start end face msg-p mouse-p)
  <span class="string">"Highlight either the region/buffer or new input that you type.
Use the region if active, or the buffer otherwise.

If *ALL* of the following are true then apply the last-used face as a
text property to the next and subsequent characters that you type, and
add that face to a Facemenu menu (`Text Properties' or one of its
submenus):

 * You call this command interactively.
 * You use no prefix arg.
 * Option `<span class="constant important">hlt-use-overlays-flag</span>' is nil
 * The last property used for highlighting was `<span class="constant important">face</span>'.

Otherwise, the behavior respects `<span class="constant important">hlt-use-overlays-flag</span>' and depends
on the optional arguments, as follows:

 Args START and END are the limits of the area to act on.
  They default to the region limits.  If the region is not active or
  it is empty, then use the whole buffer.

 Third arg FACE is the face to use.
  Interactively, this is the last face that was used for highlighting.
  (You can use command `<span class="constant important">hlt-choose-default-face</span>' to choose a different face.)

 Fourth arg MSG-P non-nil means to display a progress message.
  Interactively, MSG-P is t.

 Fifth arg MOUSE-P non-nil means use `<span class="constant important">mouse-face</span>', not `<span class="constant important">face</span>'.
  Interactively, MOUSE-P is provided by the prefix arg."</span>
  (interactive `(,@(hlt-region-or-buffer-limits) nil t ,current-prefix-arg))
  (<span class="keyword cl">when</span> hlt-auto-faces-flag (hlt-next-face))
  (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                             (setq start  (car start-end)
                                   end    (cadr start-end))))
  (<span class="keyword elisp">if</span> face (setq hlt-last-face  face) (setq face  hlt-last-face))
  (<span class="keyword cl">when</span> (and msg-p  (or (hlt-nonempty-region-p)  mouse-p)) (message <span class="string">"Highlighting..."</span>))
  (<span class="keyword elisp">let</span> ((read-only                           buffer-read-only)
        (modified-p                          (buffer-modified-p))
        (inhibit-modification-hooks          t)
        <span class="comment">;; Otherwise, `<span class="constant important">put-text-property</span>' calls this, which removes highlight.</span>
        (font-lock-fontify-region-function  'ignore)
        overlay)
    (setq buffer-read-only  nil)
    (<span class="keyword elisp">cond</span> (hlt-use-overlays-flag
           (setq overlay  (make-overlay start end))
           (overlay-put overlay (<span class="keyword elisp">if</span> mouse-p 'mouse-face 'face) face)
           (overlay-put overlay 'hlt-highlight                 face))
          (mouse-p (put-text-property start end 'mouse-face face))
          ((interactive-p)
           (message <span class="string">"Text you type now will have face `<span class="constant important">%s</span>'."</span> face)
           (facemenu-add-new-face face)
           <span class="comment">;; It is `<span class="constant important">facemenu-add-face</span>' that either uses region or next insert.</span>
           (facemenu-add-face face
                              (and (hlt-nonempty-region-p)  start)
                              (and (hlt-nonempty-region-p)  end))
           (<span class="keyword cl">when</span> (hlt-nonempty-region-p)
             (put-text-property start end 'hlt-highlight    face)
             (put-text-property start end 'font-lock-ignore t)))
          (t (put-text-property start end 'face             face)
             (put-text-property start end 'hlt-highlight    face)
             (put-text-property start end 'font-lock-ignore t)))
    (setq buffer-read-only  read-only)
    (set-buffer-modified-p modified-p))
  (<span class="keyword elisp">let</span> ((remove-msg  (substitute-command-keys
                      <span class="string">"`\\[<span class="constant important">universal-argument</span>] \\[<span class="constant important">hlt-highlight</span>]' to remove highlighting"</span>)))
    (<span class="keyword cl">when</span> (and msg-p  (or (hlt-nonempty-region-p)  mouse-p))
      (message <span class="string">"Highlighting... done. %s"</span> remove-msg))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-unhighlight-region</span> (<span class="type">&amp;optional</span> start end face msg-p mouse-p)
  <span class="string">"Remove all highlighting in region or buffer.
Use the region if active, or the buffer otherwise.
The arguments are the same as those for `<span class="constant important">hlt-highlight-region</span>'.

If `<span class="constant important">hlt-use-overlays-flag</span>' is non-nil, then remove overlay highlighting.
If `<span class="constant important">hlt-use-overlays-flag</span>' is not `<span class="constant important">only</span>', then remove text-property
highlighting.  This means, in particular, that a value of nil removes
both overlays and text properties."</span>
  (interactive `(,@(hlt-region-or-buffer-limits) nil t ,current-prefix-arg))
  (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                             (setq start  (car start-end)
                                   end    (cadr start-end))))
  (<span class="keyword cl">when</span> msg-p (message <span class="string">"Removing highlighting..."</span>))
  (<span class="keyword elisp">let</span> ((read-only-p  buffer-read-only)
        (modified-p   (buffer-modified-p)))
    (setq buffer-read-only  nil)
    (<span class="keyword cl">when</span> hlt-use-overlays-flag         <span class="comment">; Unhighlight overlay properties.</span>
      (<span class="keyword cl">dolist</span> (ov  (overlays-in start end))
        (hlt-unhighlight-for-overlay ov start end face)))
    (<span class="keyword cl">unless</span> (eq 'only hlt-use-overlays-flag) <span class="comment">; Unhighlight text properties.</span>
      (<span class="keyword elisp">let</span> ((beg  start)
            hi-face)
        (<span class="keyword elisp">while</span> (&lt; beg end)
          (<span class="keyword cl">when</span> (setq hi-face  (get-text-property beg 'hlt-highlight))
            (<span class="keyword cl">when</span> (or (null face)  (equal hi-face face))
              <span class="comment">;; $$$ Really, we should remove only the part of the `<span class="constant important">face</span>'</span>
              <span class="comment">;;     property that belongs to Highlight, and set the value to be</span>
              <span class="comment">;;     the same as it is, but without hlt-last-face.</span>
              (remove-text-properties
               beg (1+ beg) (<span class="keyword elisp">if</span> mouse-p
                                '(mouse-face nil hlt-highlight nil font-lock-ignore nil)
                              '(face nil hlt-highlight nil font-lock-ignore nil)))))
          (setq beg  (1+ beg)))))
    (setq buffer-read-only  read-only-p)
    (set-buffer-modified-p modified-p))
  (<span class="keyword cl">when</span> msg-p (message <span class="string">"Removing highlighting... done."</span>)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-highlight-regexp-region</span> (<span class="type">&amp;optional</span> start end regexp face msg-p mouse-p nth)
  <span class="string">"Highlight regular expression REGEXP in region/buffer.
Use the region if active, or the buffer otherwise.

Optional args START and END are the limits of the area to act on.
  They default to the region limits.
Optional 4th arg FACE is the face to use.
  Interactively, this is the last face that was used for highlighting.
  (You can use command `<span class="constant important">hlt-choose-default-face</span>' to choose a different face.)
Optional 5th arg MSG-P:
  t means to treat this as an interactive call when deciding to
    display all messages.
  non-nil &amp; non-t means to display only error and warning messages.
Optional 6th arg MOUSE-P non-nil means to use `<span class="constant important">mouse-face</span>' property,
  not `<span class="constant important">face</span>'.  Interactively, this is provided by the prefix arg.
Optional 7th arg NTH determines which regexp subgroup is highlighted.
  If nil or 0, the entire regexp is highlighted.  Otherwise, the NTH
  regexp subgroup (\"\\\\(...\\\\)\" expression) is highlighted.
  (NTH is not available interactively.)"</span>
  (interactive (hlt-+/--highlight-regexp-read-args <span class="string">""</span> 'REGION))
  (hlt-+/--highlight-regexp-region nil start end regexp face msg-p mouse-p nth))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-unhighlight-regexp-region</span> (<span class="type">&amp;optional</span> start end regexp face msg-p mouse-p nth)
  <span class="string">"Unhighlight text matching regular expression REGEXP in region/buffer.
This is like `<span class="constant important">hlt-highlight-regexp-region</span>' (which see), but opposite.
Where `<span class="constant important">hlt-highlight-regexp-region</span>' highlights REGEXP matches, this
unhighlights the matches."</span>
  (interactive (hlt-+/--highlight-regexp-read-args <span class="string">"UN"</span> 'REGION))
  (hlt-+/--highlight-regexp-region 'UNHIGHLIGHT start end regexp face msg-p mouse-p nth))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-highlight-regexp-to-end</span> (regexp <span class="type">&amp;optional</span> face msg-p mouse-p nth)
  <span class="string">"Highlight text after cursor that matches REGEXP.
The behavior respects `<span class="constant important">hlt-use-overlays-flag</span>' and depends on the
optional arguments, as follows:

 Optional 2nd arg FACE is the face to use.
  Interactively, this is the last face that was used for highlighting.
  (You can use command `<span class="constant important">hlt-choose-default-face</span>' to choose a different
  face.)

 Optional 3rd arg MSG-P non-nil means to display a progress message.
  Interactively, MSG-P is t.

 Optional 4th arg MOUSE-P non-nil means use property `<span class="constant important">mouse-face</span>', not
 `<span class="constant important">face</span>'.  Interactively, MOUSE-P is provided by the prefix arg.

 Optional 5th arg NTH determines which regexp subgroup is highlighted.
  If nil or 0, the entire regexp is highlighted.  Otherwise, the NTH
  regexp subgroup (\"\\\\(...\\\\)\" expression) is highlighted.
  (NTH is not available interactively.)"</span>
  (interactive (hlt-+/--highlight-regexp-read-args <span class="string">""</span> nil))
  (hlt-+/--highlight-regexp-region nil (point) (point-max) regexp face msg-p mouse-p nth))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-unhighlight-regexp-to-end</span> (regexp <span class="type">&amp;optional</span> face msg-p mouse-p nth)
  <span class="string">"UNhighlight text after cursor that matches REGEXP.
This is like `<span class="constant important">hlt-highlight-regexp-to-end</span>' (which see), but opposite.
Where `<span class="constant important">hlt-highlight-regexp-to-end</span>' highlights REGEXP matches, this
unhighlights the matches."</span>
  (interactive (hlt-+/--highlight-regexp-read-args <span class="string">"UN"</span> nil))
  (hlt-+/--highlight-regexp-region 'UNHIGHLIGHT
                                   (point) (point-max) regexp face msg-p mouse-p nth))

(<span class="keyword">defun</span> <span class="function">hlt-+/--highlight-regexp-read-args</span> (un regionp)
  <span class="string">"Read arguments for `hlt-(un)highlight-regexp-(region|to-end)'."</span>
  (<span class="keyword elisp">let</span> ((prompt  (format <span class="string">"Regexp to %shighlight%s: "</span> un (<span class="keyword elisp">if</span> regionp <span class="string">""</span> <span class="string">" after cursor"</span>))))
    `(,@(and regionp  (hlt-region-or-buffer-limits))
      ,(<span class="keyword elisp">if</span> (fboundp 'icicle-read-string-completing)
           (icicle-read-string-completing prompt
                                          hlt-last-regexp
                                          (<span class="keyword elisp">lambda</span> (c) (string-match <span class="string">"regexp"</span> (symbol-name c)))
                                          (<span class="keyword elisp">if</span> (and (boundp 'hi-lock-mode)  hi-lock-mode)
                                              'hi-lock-regexp-history
                                            'regexp-history))
           (read-string prompt nil
                        (<span class="keyword elisp">if</span> (and (boundp 'hi-lock-mode)  hi-lock-mode)
                            'hi-lock-regexp-history
                          'regexp-history)
                        hlt-last-regexp))
      nil t ,current-prefix-arg)))

(<span class="keyword">defun</span> <span class="function">hlt-+/--highlight-regexp-region</span> (unhighlightp start end regexp face msg-p mouse-p nth)
  <span class="string">"Helper for `hlt-(un)highlight-regexp-region'.
Non-nil UNHIGHLIGHTP means unhighlight.  Otherwise, highlight.
The other arguments are as for `<span class="constant important">hlt-highlight-regexp-region</span>'.
If UNHIGHLIGHTP:
 Do not advance to the next face, even if `<span class="constant important">hlt-auto-faces-flag</span>'.
 If FACE is nil then unhighlight all faces."</span>
  (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                             (setq start  (car start-end)
                                   end    (cadr start-end))))
  (<span class="keyword cl">unless</span> regexp (setq regexp  hlt-last-regexp))
  (<span class="keyword cl">unless</span> (stringp regexp)              <span class="comment">; Else re-search-forward gets an error</span>
    (<span class="warning">error</span> <span class="string">"HLT-%sHIGHLIGHT-REGEXP-REGION: REGEXP arg is not a string: `<span class="constant important">%S</span>'"</span>
           (<span class="keyword elisp">if</span> unhighlightp <span class="string">"UN"</span> <span class="string">""</span>) regexp))
  <span class="comment">;; Advance the face if highlighting (but not unhighlighting) with auto faces.</span>
  (<span class="keyword cl">when</span> (and hlt-auto-faces-flag  (not unhighlightp)) (hlt-next-face))
  (<span class="keyword elisp">if</span> face (setq hlt-last-face  face) (<span class="keyword cl">unless</span> unhighlightp (setq face  hlt-last-face)))
  (<span class="keyword cl">when</span> (and msg-p  (not unhighlightp))
    (<span class="keyword elisp">let</span> ((reg-size  (abs (- end start))))
      (<span class="keyword cl">when</span> (and (&gt; reg-size hlt-max-region-no-warning)
                 (not (<span class="keyword elisp">progn</span>
                        (and (fboundp 'flash-ding) <span class="comment">; In `frame-fns.el'</span>
                             (flash-ding 'no-terminate-macros (selected-frame)))
                        (y-or-n-p (substitute-command-keys
                                   (format <span class="string">"Lots of highlighting slows \
things down.  Do you really want to highlight up to %d chars?  "</span>
                                           reg-size))))))
        (<span class="warning">error</span> <span class="string">"OK, highlighting was cancelled"</span>))))
  (<span class="keyword cl">when</span> (eq t msg-p)
    (message <span class="string">"%sighlighting occurrences of `<span class="constant important">%s</span>'..."</span> (<span class="keyword elisp">if</span> unhighlightp <span class="string">"UNh"</span> <span class="string">"H"</span>) regexp))
  (<span class="keyword elisp">let</span> ((hits-p               nil)
        (hlt-auto-faces-flag  nil))     <span class="comment">; Prevent advancing - we already advanced.</span>
    (<span class="keyword elisp">save-excursion</span>
      (goto-char start)
      (<span class="keyword elisp">while</span> (and (&lt; start end)  (not (eobp))  (re-search-forward regexp end t)
                  (setq hits-p  t))
        (<span class="keyword elisp">condition-case</span> nil
            (<span class="keyword elisp">progn</span> (forward-char 1) (setq start  (1+ (point))))
          (end-of-buffer (setq start  end)))
        (funcall (<span class="keyword elisp">if</span> unhighlightp #'hlt-unhighlight-region #'hlt-highlight-region)
                 (match-beginning (or nth  0))
                 (match-end (or nth  0)) face nil mouse-p)))
    (<span class="keyword cl">when</span> (eq t msg-p)
      (<span class="keyword elisp">if</span> hits-p
          (message <span class="string">"%sighlighting occurrences of `<span class="constant important">%s</span>' done.  %s"</span> (<span class="keyword elisp">if</span> unhighlightp <span class="string">"UNh"</span> <span class="string">"H"</span>)
                   regexp
                   (<span class="keyword elisp">if</span> (not unhighlightp)
                       (substitute-command-keys
                        <span class="string">"`\\[<span class="constant important">negative-argument</span>] \\[<span class="constant important">hlt-highlight</span>]' to remove highlighting"</span>)
                     <span class="string">""</span>))
        (message <span class="string">"No occurrences of `<span class="constant important">%s</span>'"</span> regexp))))
  (setq hlt-last-regexp  regexp))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-unhighlight-region-for-face</span> (<span class="type">&amp;optional</span> face start end mouse-p)
  <span class="string">"Remove any highlighting in the region that uses FACE.
Same as `<span class="constant important">hlt-unhighlight-region</span>', but removes only highlighting
that uses FACE.  Interactively, you are prompted for the face.

This works only for overlay highlighting, not text-property
highlighting.

Note: When text in the region has been highlighted using more than one
face, unhighlighting for one of those faces can mean that adjacent
highlighting outside the region appears to change.  That outside text
still has the same multiple-overlay face highlighting, but the overlay
stacking order is not the same as it was.

Optional arg FACE is the face to use.
  Interactively, this is the last face that was used for highlighting.
  (You can use command `<span class="constant important">hlt-choose-default-face</span>' to choose a different face.)
Optional args START and END are the limits of the area to act on.
  They default to the region limits.
Optional arg MOUSE-P non-nil means use `<span class="constant important">mouse-face</span>' property, not
  `<span class="constant important">face</span>'.  Interactively, MOUSE-P is provided by the prefix arg."</span>
  (interactive `(,(hlt-read-bg/face-name <span class="string">"Remove highlight overlays that use face: "</span>)
                  ,@(hlt-region-or-buffer-limits) ,current-prefix-arg))
  (<span class="keyword elisp">if</span> face (setq hlt-last-face  face) (setq face  hlt-last-face))
  (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                             (setq start  (car start-end)
                                   end    (cadr start-end))))
  (hlt-unhighlight-region start end face (interactive-p) mouse-p))

<span class="comment">;; No longer used - use `<span class="constant important">hlt-unhighlight-for-overlay</span>' instead.</span>
(<span class="keyword">defun</span> <span class="function">hlt-delete-highlight-overlay</span> (overlay <span class="type">&amp;optional</span> face)
  <span class="string">"Delete OVERLAY if it was created by highlighting (library `<span class="constant important">highlight</span>').
Optional arg FACE is a face symbol.  If non-nil, then delete only
overlays with that FACE."</span>
  (<span class="keyword elisp">let</span> ((highlight-face  (overlay-get overlay 'hlt-highlight)))
    (<span class="keyword cl">when</span> (and highlight-face  (or (not face)  (equal face highlight-face)))
      (delete-overlay overlay))))

(<span class="keyword cl">unless</span> (fboundp 'copy-overlay)         <span class="comment">; Defined in Emacs 22+.</span>
  (<span class="keyword">defun</span> <span class="function">copy-overlay</span> (o)
    <span class="string">"Return a copy of overlay O."</span>
    (<span class="keyword elisp">let</span> ((o1 (<span class="keyword elisp">if</span> (overlay-buffer o)
                  (make-overlay (overlay-start o) (overlay-end o)
                                <span class="comment">;; FIXME: there's no easy way to find the</span>
                                <span class="comment">;; insertion-type of the two markers.</span>
                                (overlay-buffer o))
                (<span class="keyword elisp">let</span> ((o1 (make-overlay (point-min) (point-min))))
                  (delete-overlay o1)
                  o1)))
          (props (overlay-properties o)))
      (<span class="keyword elisp">while</span> props
        (overlay-put o1 (pop props) (pop props)))
      o1)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-replace-highlight-face</span> (old-face new-face <span class="type">&amp;optional</span> start end msg-p mouse-p)
  <span class="string">"Replace OLD-FACE by NEW-FACE in overlay highlighting in the region.
This command applies only to overlay highlighting created by library
`highlight.el'.

Update the last-used highlighting face.

With a prefix argument, replace OLD-FACE as the `<span class="constant important">mouse-face</span>' property,
 not the `<span class="constant important">face</span>' property.

Other arguments:
 Optional args START and END are the limits of the area to act on.
  They default to the region limits.  If the region is not active or
  it is empty, then use the whole buffer.
 Optional arg MSG-P non-nil means display a progress message.
 Optional arg MOUSE-P non-nil means use `<span class="constant important">mouse-face</span>' property, not
  `<span class="constant important">face</span>'.  Interactively, MOUSE-P is provided by the prefix arg."</span>
  (interactive `(,(hlt-read-bg/face-name <span class="string">"Replace face in region highlights. Old face: "</span>)
                 ,(hlt-read-bg/face-name <span class="string">"New face: "</span>)
                 ,@(hlt-region-or-buffer-limits) t ,current-prefix-arg))
  (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                             (setq start  (car start-end)
                                   end    (cadr start-end))))
  (<span class="keyword cl">when</span> msg-p (message <span class="string">"Replacing highlighting face `<span class="constant important">%s</span>'..."</span> old-face))
  (<span class="keyword elisp">let</span> ((read-only-p  buffer-read-only)
        (modified-p   (buffer-modified-p)))
    (setq buffer-read-only  nil)
    (<span class="keyword cl">dolist</span> (ov  (overlays-in start end))
      (<span class="keyword cl">when</span> (equal old-face (overlay-get ov (<span class="keyword elisp">if</span> mouse-p 'mouse-face 'face)))
        (overlay-put ov (<span class="keyword elisp">if</span> mouse-p 'mouse-face 'face) new-face)
        (overlay-put ov 'hlt-highlight                 new-face)))
    (setq buffer-read-only  read-only-p)
    (set-buffer-modified-p modified-p))
  (setq hlt-last-face  new-face)
  (<span class="keyword cl">when</span> msg-p (message <span class="string">"Replacing overlay highlighting face `<span class="constant important">%s</span>'... done."</span> old-face)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-highlight-symbol</span> (symbol <span class="type">&amp;optional</span> start end)
  <span class="string">"Highlight occurrences of SYMBOL.
Use the region if active, or the buffer otherwise.
\(This first unhighlights occurrences, to prevent stacking up multiple
highlighting on the same occurrences.)"</span>
  (interactive
   (<span class="keyword elisp">save-excursion</span>
     (<span class="keyword cl">when</span> (listp last-nonmenu-event)
       (mouse-set-point last-nonmenu-event))
     (<span class="keyword elisp">let</span> ((symb  (symbol-at-point)))
       (<span class="keyword cl">unless</span> symb (<span class="warning">error</span> <span class="string">"No symbol %s"</span> (<span class="keyword elisp">if</span> (listp last-nonmenu-event)
                                              <span class="string">"under mouse pointer"</span>
                                            <span class="string">"at point"</span>)))
       (list symb))))
  (<span class="keyword elisp">let</span> ((hlt-auto-faces-flag  t)
        (limits               (hlt-region-or-buffer-limits))
        (regexp               (format (<span class="keyword elisp">if</span> (&gt; emacs-major-version 21)
                                          <span class="string">"\\_&lt;%s\\_&gt;"</span>
                                        <span class="string">"%s"</span>)
                                      symbol)))
    (hlt-unhighlight-regexp-region (car limits) (cadr limits) regexp)
    (hlt-highlight-regexp-region   (car limits) (cadr limits) regexp)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-unhighlight-symbol</span> (symbol <span class="type">&amp;optional</span> start end)
  <span class="string">"Unhighlight occurrences of SYMBOL.
Use the region if active, or the buffer otherwise."</span>
  (interactive
   (<span class="keyword elisp">save-excursion</span>
     (<span class="keyword cl">when</span> (listp last-nonmenu-event)
       (mouse-set-point last-nonmenu-event))
     (<span class="keyword elisp">let</span> ((symb  (symbol-at-point)))
       (<span class="keyword cl">unless</span> symb (<span class="warning">error</span> <span class="string">"No symbol %s"</span> (<span class="keyword elisp">if</span> (listp last-nonmenu-event)
                                              <span class="string">"under mouse pointer"</span>
                                            <span class="string">"at point"</span>)))
       (list symb))))
  (<span class="keyword elisp">let</span> ((hlt-auto-faces-flag  t)
        (limits               (hlt-region-or-buffer-limits))
        (regexp               (format (<span class="keyword elisp">if</span> (&gt; emacs-major-version 21)
                                          <span class="string">"\\_&lt;%s\\_&gt;"</span>
                                        <span class="string">"%s"</span>)
                                      symbol)))
    (hlt-unhighlight-regexp-region (car limits) (cadr limits) regexp)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-highlight-enclosing-list</span> (arg <span class="type">&amp;optional</span> face mousep)
  <span class="string">"Highlight the ARGth level sexp enclosing point.
ARG is the numeric prefix value.

A negative prefix arg prompts you for the face to use.  This face is
used by default from then on.  You can also choose the default face
using command `<span class="constant important">hlt-choose-default-face</span>'.  The same face is used as the
default for all `<span class="constant important">hlt-*</span>' functions.

When used in Lisp code:
 MOUSEP non-nil means use property `<span class="constant important">mouse-face</span>', not `<span class="constant important">face</span>'."</span>
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (<span class="keyword elisp">if</span> (&lt; (prefix-numeric-value current-prefix-arg) 0)
                         (call-interactively #'hlt-choose-default-face)
                       hlt-last-face)))
  (<span class="keyword cl">unless</span> arg (setq arg  1))
  (set-mark (<span class="keyword elisp">save-excursion</span> (up-list (- arg)) (point)))
  (up-list arg)
  (<span class="keyword cl">unless</span> face (setq face  hlt-last-face))
  (hlt-highlight-region nil nil face 'MSGP mousep)
  (setq mark-active  nil))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-highlight-single-quotations</span> (<span class="type">&amp;optional</span> face)
  <span class="string">"Highlight single-quoted text in the region.
This means, for example, commands and keys between `'s: `<span class="constant important">foobar</span>'.
If the region is not active or it is empty, then use the whole buffer.
With a prefix argument, prompt for the highlighting face to use.
Otherwise, use the last face used for highlighting.
 You can also use command `<span class="constant important">hlt-choose-default-face</span>' to choose a different face."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword elisp">if</span> face
      (setq face  (hlt-read-bg/face-name <span class="string">"Use highlighting face: "</span>) hlt-last-face face)
    (setq face  hlt-last-face))
  (apply #'hlt-highlight-regexp-region
         (append (hlt-region-or-buffer-limits)
                 (list <span class="string">"`\\([<span class="negation">^</span>']+\\)'"</span> face (and (interactive-p)  t) nil 1))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-mouse-face-each-line</span> (<span class="type">&amp;optional</span> start end face msg-p)
  <span class="string">"Put `<span class="constant important">mouse-face</span>' on each line of buffer in region.
If the region is active and not empty, then limit mouse-face
highlighting to the region.  Otherwise, use the whole buffer.
With a prefix argument, prompt for the highlighting face to use.
Otherwise, use the last face used for highlighting.
 You can also use command `<span class="constant important">hlt-choose-default-face</span>' to choose a different face.
Optional args START and END are the limits of the area to act on.
  They default to the region limits.
Optional arg MSG-P non-nil means display a progress message."</span>
  (interactive `(,@(hlt-region-or-buffer-limits) ,current-prefix-arg t))
  (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                             (setq start  (car start-end)
                                   end    (cadr start-end))))
  (<span class="keyword elisp">if</span> face
      (setq face  (hlt-read-bg/face-name <span class="string">"Use highlighting face: "</span>) hlt-last-face face)
    (setq face  hlt-last-face))
  (<span class="keyword cl">when</span> msg-p (message <span class="string">"Putting mouse face `<span class="constant important">%s</span>' on each line..."</span> face))
  (<span class="keyword elisp">let</span> ((buffer-read-only           nil)
        (inhibit-field-text-motion  t)  <span class="comment">; Just to be sure, for `<span class="constant important">end-of-line</span>'.</span>
        overlay)
    (<span class="keyword elisp">save-excursion</span>
      (<span class="keyword elisp">save-restriction</span>
        (narrow-to-region start end)
        (goto-char (point-min))
        (<span class="keyword elisp">while</span> (not (eobp))
          (<span class="keyword elisp">cond</span> (hlt-use-overlays-flag
                 (setq overlay
                       (make-overlay (point) (setq start  (<span class="keyword elisp">progn</span> (end-of-line) (point)))))
                 (overlay-put overlay 'mouse-face    face)
                 (overlay-put overlay 'hlt-highlight face))
                (t
                 (put-text-property (point) (<span class="keyword elisp">progn</span> (end-of-line) (point)) 'mouse-face face)
                 (put-text-property start end 'hlt-highlight face)))
          (forward-line 1)))))
  (<span class="keyword cl">when</span> msg-p (message <span class="string">"Putting mouse face `<span class="constant important">%s</span>' on each line... done."</span> face)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-toggle-use-overlays-flag</span> ()
  <span class="string">"Toggle `<span class="constant important">hlt-use-overlays-flag</span>'.
If the current value is non-nil, it is set to nil.
If the current value is nil, it is set to the last non-nil value."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((before-toggle  hlt-use-overlays-flag))
    (<span class="keyword elisp">if</span> hlt-use-overlays-flag
        (setq hlt-use-overlays-flag  nil)
      (setq hlt-use-overlays-flag  hlt-previous-use-overlays-flag-value))
    (setq hlt-previous-use-overlays-flag-value  before-toggle))
  (message
   (<span class="keyword elisp">cond</span> ((eq hlt-use-overlays-flag 'only)
          <span class="string">"Highlight actions now use only overlay properties, not text properties"</span>)
         (hlt-use-overlays-flag
          <span class="string">"Highlighting with overlays now, but actions affect also text properties"</span>)
         (t <span class="string">"Highlight actions now use only text properties, not overlay properties"</span>))))


<span class="comment">;;; Copying and yanking text properties</span>

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defalias</span> '<span class="function">hlt-paste-props</span> 'hlt-yank-props)
<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-yank-props</span> (start end <span class="type">&amp;optional</span> arg msgp)
  <span class="string">"Yank (paste) copied text properties over the active region.
Interactively, do nothing if there is no nonempty active region.
By default, yank only the copied properties defined by
 `<span class="constant important">hlt-default-copy/yank-props</span>'.
With a plain or non-negative prefix arg, yank all copied properties.
With a negative prefix arg, you are prompted for the copied properties
 to yank.  To finish entering properties, hit `RET RET' (i.e., twice).

NOTE: If the list of copied text properties is empty, then yanking
      REMOVES ALL PROPERTIES from the text in the region.  This
      provides an easy way to UNpropertize text."</span>
  (interactive <span class="string">"r\nP\np"</span>)
  <span class="comment">;; Do nothing if no active region.</span>
  (<span class="keyword cl">unless</span> (or (hlt-nonempty-region-p)  (not msgp))
    (<span class="warning">error</span> <span class="string">"No region to paste properties to"</span>))
  (<span class="keyword elisp">let</span> ((read-only                           buffer-read-only)
        (modified-p                          (buffer-modified-p))
        (inhibit-modification-hooks          t)
        <span class="comment">;; Otherwise, `<span class="constant important">put-text-property</span>' calls this, which removes highlight.</span>
        (font-lock-fontify-region-function   'ignore)
        (props-to-yank                       (hlt-props-to-copy/yank hlt-copied-props arg)))
    (undo-boundary)
    (setq buffer-read-only  nil)
    (set-text-properties start end props-to-yank)
    <span class="comment">;; Set/reset props `<span class="constant important">hlt-highlight</span>' and `<span class="constant important">font-lock-ignore</span>', if `<span class="constant important">face</span>' is one of the props.</span>
    <span class="comment">;; (The Emacs 20 code here is fudged: it just uses `<span class="constant important">member</span>' instead of `<span class="constant important">plist-member</span>'.)</span>
    (<span class="keyword elisp">cond</span> ((fboundp 'plist-member)
           (put-text-property
            start end 'hlt-highlight    (and (plist-member props-to-yank 'face)  t))
           (put-text-property
            start end 'font-lock-ignore (and (plist-member props-to-yank 'face)  t)))
          (t                            <span class="comment">; Emacs 20 - no `<span class="constant important">plist-member</span>'.</span>
           (put-text-property
            start end 'hlt-highlight    (and (member 'face props-to-yank)  t))
           (put-text-property
            start end 'font-lock-ignore (and (member 'face props-to-yank)  t))))
    (setq buffer-read-only  read-only)
    (set-buffer-modified-p modified-p)
    (<span class="keyword cl">when</span> msgp
      (<span class="keyword elisp">if</span> props-to-yank
          (message <span class="string">"Yanked propert%s `<span class="constant important">%s</span>'"</span> (<span class="keyword elisp">if</span> (car (cddr props-to-yank)) <span class="string">"ies"</span> <span class="string">"y"</span>)
                   (<span class="keyword elisp">let</span> ((pprops  ()))
                     (<span class="keyword elisp">while</span> props-to-yank
                       (push (pop props-to-yank) pprops)
                       (pop props-to-yank))
                     (mapconcat #'symbol-name (nreverse pprops) <span class="string">"', `"</span>)))
        (message <span class="string">"ALL PROPERTIES REMOVED (yanked empty list of properties)"</span>)))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-mouse-copy-props</span> (<span class="type">&amp;optional</span> event arg msgp)
  <span class="string">"Same as `<span class="constant important">hlt-copy-props</span>', but copy at mouse pointer, not at point."</span>
  (interactive <span class="string">"e\nP\np"</span>)
  (<span class="keyword elisp">with-current-buffer</span> (window-buffer (posn-window (event-end event)))
    (<span class="keyword elisp">save-excursion</span> (goto-char (posn-point (event-end event)))
                    (hlt-copy-props (point) arg msgp))))

<span class="comment">;; For testing</span>
<span class="comment">;; (global-set-key [C-S-down-mouse-2] 'hlt-mouse-copy-props)</span>
<span class="comment">;; (global-set-key [C-S-mouse-2]      'ignore)</span>

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hlt-copy-props</span> (<span class="type">&amp;optional</span> position arg msgp)
  <span class="string">"Copy text properties at point for use by `<span class="constant important">hlt-yank-props</span>'.
Properties are copied to `<span class="constant important">hlt-copied-props</span>'.
By default, copy the properties defined by
 `<span class="constant important">hlt-default-copy/yank-props</span>'.
With a plain or non-negative prefix arg, copy all properties.
With a negative prefix arg, you are prompted for the properties to
 copy.  To finish entering properties, hit `RET RET' (i.e., twice)."</span>
  (interactive <span class="string">"d\nP\np"</span>)
  (<span class="keyword cl">unless</span> position  (setq position  (point)))
  (<span class="keyword elisp">let</span> ((props-to-copy  (hlt-props-to-copy/yank (text-properties-at position) arg)))
    (setq hlt-copied-props  props-to-copy)
    (<span class="keyword cl">when</span> msgp
      (<span class="keyword elisp">if</span> props-to-copy
          (message <span class="string">"Copied propert%s `<span class="constant important">%s</span>'"</span> (<span class="keyword elisp">if</span> (car (cddr props-to-copy)) <span class="string">"ies"</span> <span class="string">"y"</span>)
                   (<span class="keyword elisp">let</span> ((pprops  ()))
                     (<span class="keyword elisp">while</span> props-to-copy
                       (push (pop props-to-copy) pprops)
                       (pop props-to-copy))
                     (mapconcat #'symbol-name (nreverse pprops) <span class="string">"', `"</span>)))
        (message <span class="string">"Emptied copied properties list - yanking will REMOVE ALL"</span>)))))

(<span class="keyword">defun</span> <span class="function">hlt-props-to-copy/yank</span> (avail-props arg)
  <span class="string">"Return a plist of properties to copy or yank.
AVAIL-PROPS is a plist of available properties.
ARG is from a raw prefix argument.
 If nil, then use the properties from AVAIL-PROPS that are also
  among those specified by `<span class="constant important">hlt-default-copy/yank-props</span>'.
 If a plain or non-negative prefix arg, then use all properties in
  AVAIL-PROPS.
 If a negative prefix arg, then prompt for the properties
  to use, using completion against the candidates in AVAIL-PROPS."</span>
  (<span class="keyword elisp">cond</span> ((and arg  (natnump (prefix-numeric-value arg)))
         (copy-sequence avail-props))   <span class="comment">; Copy/yank all props available.</span>
        (arg                            <span class="comment">; Prompt for props, from among those available.</span>
         (<span class="keyword elisp">let</span> ((props-avail  avail-props)
               (props-alist  ()))
           (<span class="keyword elisp">while</span> props-avail
             (push (cons (symbol-name (pop props-avail)) (pop props-avail)) props-alist))
           (<span class="keyword elisp">if</span> (not (cdr props-alist))
               avail-props
             (hlt-subplist (hlt-read-props-completing props-alist) avail-props))))
        (t                              <span class="comment">; Copy/yank the available default props.</span>
         (<span class="keyword elisp">if</span> (eq t hlt-default-copy/yank-props)
             avail-props
           (hlt-subplist hlt-default-copy/yank-props avail-props)))))

(<span class="keyword">defun</span> <span class="function">hlt-subplist</span> (properties available)
  <span class="string">"Return a plist with entries from plist AVAILABLE for PROPERTIES.
PROPERTIES is a list of properties without their values."</span>
  (<span class="keyword elisp">let</span> ((plist     ())
        (prop+val  nil))
    (<span class="keyword cl">dolist</span> (prop  properties)
      (<span class="keyword cl">when</span> (setq prop+val  (<span class="keyword elisp">if</span> (fboundp 'plist-member)
                                (plist-member available prop)
                              (member prop available))) <span class="comment">; Emacs 20 fudge.</span>
        (push prop plist)
        (push (cadr prop+val) plist)))
    (nreverse plist)))

(<span class="keyword">defun</span> <span class="function">hlt-read-props-completing</span> (props)
  <span class="string">"Read text properties from among those in PROPS.
PROPS is an alist whose cars are text property names (strings)."</span>
  (<span class="keyword elisp">let</span> ((prompt1        <span class="string">"Property (RET for each, empty input to finish): "</span>)
        (prompt2        <span class="string">"Property: "</span>)
        (props-to-copy  ())
        prop)
    (setq prop   (completing-read prompt1 props nil t)
          props  (delete (assoc prop props) props))
    (<span class="keyword cl">unless</span> (string= <span class="string">""</span> prop)
      (push (intern prop) props-to-copy)
      (<span class="keyword elisp">while</span> (and props  (not (string= <span class="string">""</span> prop)))
        (setq prop   (completing-read prompt2 props nil t)
              props  (delete (assoc prop props) props))
        (<span class="keyword cl">unless</span> (string= <span class="string">""</span> prop) (push (intern prop) props-to-copy)))
      (nreverse props-to-copy))))
 
<span class="comment">;;(@* <span class="string">"Misc Functions - Emacs 21+"</span>)</span>

<span class="comment">;;; Misc Functions - Emacs 21+ ---------------------------------------</span>

(<span class="keyword cl">when</span> (fboundp 'next-single-char-property-change) <span class="comment">; Don't bother, for Emacs 20.</span>
  (<span class="keyword">defun</span> <span class="function">hlt-show-default-face</span> (face)
    <span class="string">"Show FACE, by default, the default highlighting face.
With a prefix argument, prompt for the highlighting face to show.
Otherwise, show the last face used for highlighting.
 You can also use command `<span class="constant important">hlt-choose-default-face</span>' to choose a different face."</span>
    (interactive (list (<span class="keyword elisp">if</span> current-prefix-arg
                           (hlt-read-bg/face-name <span class="string">"Show highlighting face: "</span>)
                         hlt-last-face)))
    (hlt-listify-invisibility-spec)
    (remove-from-invisibility-spec face))

  (<span class="keyword">defun</span> <span class="function">hlt-listify-invisibility-spec</span> ()
    <span class="string">"Convert `<span class="constant important">buffer-invisibility-spec</span>' to list form.
If it is already a list, do nothing.
If it is t, set it to a list of all `<span class="constant important">invisible</span>' spec values in the buffer.
That is, for each character in the buffer that has property `<span class="constant important">invisible</span>',
the invisibility criteria specified by that value are accumulated."</span>
    (<span class="keyword cl">unless</span> (listp buffer-invisibility-spec)
      (setq buffer-invisibility-spec  nil)
      (<span class="keyword elisp">let</span> ((start  (point-min))
            (end    (point-max))
            spec)
        (<span class="keyword cl">dolist</span> (ov  (overlays-in start end))
          (<span class="keyword cl">when</span> (setq spec  (overlay-get ov 'invisible))
            (<span class="keyword cl">unless</span> (listp spec) (setq spec  (list spec)))
            (setq buffer-invisibility-spec
                  (hlt-set-union spec buffer-invisibility-spec))))
        (<span class="keyword elisp">while</span> (&lt; start end)
          (<span class="keyword cl">when</span> (setq spec  (get-text-property start 'invisible))
            (<span class="keyword cl">unless</span> (listp spec) (setq spec  (list spec)))
            (setq buffer-invisibility-spec
                  (hlt-set-union spec buffer-invisibility-spec)))
          (setq start  (1+ start)))))
    buffer-invisibility-spec)

  <span class="comment">;; From `cl-seq.el', function `<span class="constant important">union</span>', without keyword treatment.</span>
  (<span class="keyword">defun</span> <span class="function">hlt-set-union</span> (list1 list2)
    <span class="string">"Combine LIST1 and LIST2 using a set-union operation.
The result list contains all items that appear in either LIST1 or
LIST2.  This is a non-destructive function<span class="comment">; it copies the data if</span>
necessary."</span>
    (<span class="keyword elisp">cond</span> ((null list1) list2)
          ((null list2) list1)
          ((equal list1 list2) list1)
          (t
           (or (&gt;= (length list1) (length list2))
               (setq list1  (<span class="keyword elisp">prog1</span> list2 (setq list2  list1)))) <span class="comment">; Swap them.</span>
           (<span class="keyword elisp">while</span> list2
             (<span class="keyword cl">unless</span> (member (car list2) list1)
               (setq list1  (cons (car list2) list1)))
             (setq list2  (cdr list2)))
           list1)))

  <span class="comment">;; From `cl-seq.el', function `<span class="constant important">intersection</span>', without keyword treatment.</span>
  (<span class="keyword">defun</span> <span class="function">hlt-set-intersection</span> (list1 list2)
    <span class="string">"Set intersection of lists LIST1 and LIST2.
This is a non-destructive operation: it copies the data if necessary."</span>
    (and list1  list2
         (<span class="keyword elisp">if</span> (equal list1 list2)
             list1
           (<span class="keyword elisp">let</span> ((result  ()))
             (<span class="keyword cl">unless</span> (&gt;= (length list1) (length list2))
               (setq list1  (<span class="keyword elisp">prog1</span> list2 (setq list2  list1)))) <span class="comment">; Swap them.</span>
             (<span class="keyword elisp">while</span> list2
               (<span class="keyword cl">when</span> (member (car list2) list1)
                 (setq result  (cons (car list2) result)))
               (setq list2  (cdr list2)))
             result))))

  (<span class="keyword">defun</span> <span class="function">hlt-hide-default-face</span> (<span class="type">&amp;optional</span> start end face)
    <span class="string">"Hide the last face used for highlighting.
With a prefix argument, prompt for the highlighting face to hide,
 instead.  You can also use command `<span class="constant important">hlt-choose-default-face</span>' to
 choose a different face.

If `<span class="constant important">hlt-act-on-any-face-flag</span>' is non-nil, then the face to be hidden
can be any face you choose.  Otherwise, it must be a face that has
been used for highlighting.

Hiding a face at some location means two things:
1) setting its `<span class="constant important">invisible</span>' property there, making it susceptible to
   being hidden by `<span class="constant important">buffer-invisibility-spec</span>', and
2) adding it to `<span class="constant important">buffer-invisibility-spec</span>', so that it is hidden.

This command hides all text with the specified face that has the
`<span class="constant important">invisible</span>' property, throughout the entire buffer.  However, it only
adds the `<span class="constant important">invisible</span>' property to text with an overlay or text
property, depending on `<span class="constant important">hlt-use-overlays-flag</span>', and it only does so
within the region, if the region is active.

Non-interactively:
FACE is the face to hide. It defaults to the last highlighting face.
START and END are the limits of the area to act on. They default to
  the region limits."</span>
    (interactive `(,@(hlt-region-or-buffer-limits)
                   ,(<span class="keyword elisp">if</span> current-prefix-arg
                        (hlt-read-bg/face-name <span class="string">"Hide highlighting face: "</span>)
                        hlt-last-face)))
    (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                               (setq start  (car start-end)
                                     end    (cadr start-end))))
    (hlt-listify-invisibility-spec)
    <span class="comment">;; Add FACE to `<span class="constant important">invisible</span>' property throughout START...END,</span>
    <span class="comment">;; whenever it is used as a highlighting face.</span>
    (<span class="keyword elisp">save-excursion</span>
      (<span class="keyword elisp">save-window-excursion</span>
        (goto-char start)
        (<span class="keyword elisp">let</span> ((zone-beg  start)
              zone-end zone)
          (<span class="keyword elisp">while</span> (and zone-beg  (&lt; zone-beg end))
            (setq zone      (hlt-next-highlight zone-beg end face nil nil 'no-error-msg)
                  zone-beg  (car zone)
                  zone-end  (cdr zone))
            <span class="comment">;; Add FACE to `<span class="constant important">invisible</span>' property from `<span class="constant important">zone-beg</span>' to `<span class="constant important">zone-end</span>'.</span>
            (<span class="keyword cl">when</span> hlt-use-overlays-flag
              (<span class="keyword elisp">let</span> ((overlays  (overlays-at zone-beg)))
                (<span class="keyword elisp">while</span> overlays
                  (<span class="keyword cl">when</span> (and (or hlt-act-on-any-face-flag
                                 (equal face (overlay-get (car overlays) 'hlt-highlight)))
                             (equal face (overlay-get (car overlays) 'face)))
                    (overlay-put (car overlays) 'invisible
                                 (hlt-add-listifying
                                  (overlay-get (car overlays) 'invisible)
                                  face)))
                  (<span class="keyword cl">when</span> overlays (setq overlays  (cdr overlays))))))
            (<span class="keyword cl">when</span> (and (not (eq hlt-use-overlays-flag 'only))
                       (or hlt-act-on-any-face-flag
                           (equal face (get-text-property (point) 'hlt-highlight)))
                       <span class="comment">;; $$$$$$ (equal face (get-text-property (point) 'face)))</span>
                       (<span class="keyword elisp">let</span> ((pt-faces  (get-text-property (point) 'face)))
                         (<span class="keyword elisp">if</span> (consp pt-faces) (memq face pt-faces) (equal face pt-faces))))
              (put-text-property zone-beg zone-end 'invisible
                                 (hlt-add-listifying
                                  (get-text-property zone-beg 'invisible)
                                  face)))
            (hlt-add-to-invisibility-spec face))))))

  <span class="comment">;; Same as `<span class="constant important">add-to-invisibility-spec</span>', except it doesn't allow duplicates.</span>
  (<span class="keyword">defun</span> <span class="function">hlt-add-to-invisibility-spec</span> (element)
    <span class="string">"Add ELEMENT to `<span class="constant important">buffer-invisibility-spec</span>'.
See documentation for `<span class="constant important">buffer-invisibility-spec</span>' for the kind of elements
that can be added."</span>
    (<span class="keyword cl">when</span> (eq buffer-invisibility-spec t) (setq buffer-invisibility-spec  (list t)))
    (add-to-list 'buffer-invisibility-spec element))

  (<span class="keyword">defun</span> <span class="function">hlt-add-listifying</span> (orig-val val-to-add)
    <span class="string">"Add VAL-TO-ADD to list ORIG-VAL, listifying ORIG-VAL first if needed."</span>
    (<span class="keyword cl">unless</span> (listp orig-val) (setq orig-val  (list orig-val)))
    (add-to-list 'orig-val val-to-add)
    orig-val)

  <span class="comment">;; Suggested binding: `<span class="constant important">C-S-n</span>'.</span>
  (<span class="keyword">defun</span> <span class="function">hlt-next-highlight</span> (<span class="type">&amp;optional</span> start end face mouse-p backward-p no-error-p)
    <span class="string">"Go to the next highlight in FACE.
Interactively:

 * If `<span class="constant important">hlt-auto-faces-flag</span>' is non-nil then FACE is:
      the `<span class="constant important">hlt-auto-face-backgrounds</span>' face at point, if any, 
   or the last  `<span class="constant important">hlt-auto-face-backgrounds</span>' face used, if any,
   or the first `<span class="constant important">hlt-auto-face-backgrounds</span>' face, if not.

 * If `<span class="constant important">hlt-auto-faces-flag</span>' is nil then FACE is the last face used for
    highlighting.  Remember that you can use command
   `<span class="constant important">hlt-choose-default-face</span>' to choose a different highlighting face.

If `<span class="constant important">hlt-act-on-any-face-flag</span>' is non-nil, then the target face can be
any face you choose.  Otherwise, it must be a face that has been used
for highlighting.

With a prefix argument, go to the next `<span class="constant important">mouse-face</span>' property with
FACE, not the next `<span class="constant important">face</span>' property.

If `<span class="constant important">hlt-use-overlays-flag</span>' is non-nil, then overlay highlighting is
targeted.  If `<span class="constant important">hlt-use-overlays-flag</span>' is not `<span class="constant important">only</span>', then
text-property highlighting is targeted.  This means, in particular,
that a value of nil targets both overlays and text properties.

If the region is active and not empty, then limit movement to the
region.  Otherwise, use the whole buffer.

When called non-interactively:

 - START and END are the buffer limits: region or whole buffer.

 - non-nil MOUSE-P means use `<span class="constant important">mouse-face</span>' property, not `<span class="constant important">face</span>'.

 - non-nil NO-ERROR-P means do not raise an error if no highlight with
   FACE is found, and leave point at END.

 - Return a cons of the limits of the text starting at point that has
   property `<span class="constant important">hlt-highlight</span>' of value FACE: (BEGIN-FACE . END-FACE), where
   BEGIN-FACE is point and END-FACE is the first position just after
   value FACE ends."</span>
    (interactive
     `(,@(hlt-region-or-buffer-limits)
       ,(<span class="keyword elisp">if</span> (not hlt-auto-faces-flag)
            nil                         <span class="comment">; Use `<span class="constant important">hlt-last-face</span>'.</span>
            (<span class="keyword elisp">save-excursion</span>
              (<span class="keyword cl">when</span> (listp last-nonmenu-event)
                (mouse-set-point last-nonmenu-event))
              (<span class="keyword elisp">let</span>* ((face  (get-char-property (point) 'face))
                     (face  (<span class="keyword elisp">if</span> (and (consp face)  (facep (car face)))
                                (car face)
                              face))    <span class="comment">; Use only 1st face at pt.</span>
                     (bg    (<span class="keyword elisp">if</span> (facep face)
                                (face-background face)
                              (cdr (assq 'background-color face))))
                     (hlt   (equal face (get-char-property (point) 'hlt-highlight)))
                     (bg/f  (or (and hlt (car (member face hlt-auto-face-backgrounds)))
                                (and hlt (car (member bg   hlt-auto-face-backgrounds)))
                                (car hlt-auto-face-backgrounds))))
                (<span class="keyword elisp">if</span> (facep bg/f)
                    bg/f 
                  `((background-color . ,bg/f)
                    (foreground-color . ,hlt-auto-face-foreground))))))
       ,current-prefix-arg))
    (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                               (setq start  (car start-end)
                                     end    (cadr start-end))))
    (<span class="keyword elisp">if</span> face (setq hlt-last-face  face) (setq face  hlt-last-face))
    (<span class="keyword cl">when</span> backward-p (setq end  (<span class="keyword elisp">prog1</span> start (setq start  end))))
    (<span class="keyword elisp">let</span> ((face-found  nil)
          (orig-point  (point))
          (beg         start))
      (<span class="keyword elisp">while</span> (and (not (<span class="keyword elisp">if</span> backward-p (bobp) (eobp)))
                  (not (equal face face-found))
                  (not (= beg end)))
        (<span class="keyword elisp">save-restriction</span>
          (narrow-to-region beg end)
          (setq beg  (<span class="keyword elisp">if</span> backward-p
                         (goto-char (previous-single-char-property-change
                                     (point) (<span class="keyword elisp">if</span> mouse-p 'mouse-face 'face)
                                     nil (point-min)))
                       (goto-char (next-single-char-property-change
                                   (point) (<span class="keyword elisp">if</span> mouse-p 'mouse-face 'face)
                                   nil (point-max))))))
        (<span class="keyword cl">when</span> hlt-use-overlays-flag
          (<span class="keyword elisp">let</span> ((overlays  (overlays-at (point))))
            (<span class="keyword elisp">while</span> overlays
              (<span class="keyword cl">when</span> (and (or hlt-act-on-any-face-flag
                             (equal face (overlay-get (car overlays) 'hlt-highlight)))
                         (equal face (overlay-get (car overlays) 'face)))
                (setq face-found  face
                      overlays    ()))
              (<span class="keyword cl">when</span> overlays (setq overlays  (cdr overlays))))))
        (<span class="keyword cl">when</span> (and (not face-found)
                   (not (eq hlt-use-overlays-flag 'only))
                   (or hlt-act-on-any-face-flag
                       (equal face (get-char-property (point) 'hlt-highlight)))
                   <span class="comment">;; $$$$$$ (equal face (get-char-property (point) 'face)))</span>
                   (<span class="keyword elisp">let</span> ((pt-faces  (get-char-property (point) 'face)))
                     (<span class="keyword elisp">if</span> (consp pt-faces) (memq face pt-faces) (equal face pt-faces))))
          (setq face-found  face))
        (<span class="keyword cl">when</span> (and (= beg end)          <span class="comment">; Wrap around.</span>
                   (<span class="keyword elisp">if</span> backward-p (&lt; orig-point start) (&gt; orig-point start)))
          (setq beg  start) (goto-char beg)))
      (<span class="keyword cl">unless</span> (or (and (equal face face-found)  (not (eq (point) orig-point)))  no-error-p)
        (goto-char orig-point)
        (<span class="warning">error</span> <span class="string">"No %s highlight with face `<span class="constant important">%s</span>'"</span> (<span class="keyword elisp">if</span> backward-p <span class="string">"previous"</span> <span class="string">"next"</span>) face)))
    (<span class="keyword cl">unless</span> (interactive-p)
      (cons (point)
            (next-single-char-property-change (point) (<span class="keyword elisp">if</span> mouse-p 'mouse-face 'face)
                                              nil (<span class="keyword elisp">if</span> backward-p start end)))))

  <span class="comment">;; Suggested binding: `<span class="constant important">C-S-p</span>'.</span>
  (<span class="keyword">defun</span> <span class="function">hlt-previous-highlight</span> (<span class="type">&amp;optional</span> start end face mouse-p no-error-p)
    <span class="string">"Go to the previous highlight in the last face used for highlighting.
This is the same as `<span class="constant important">hlt-previous-highlight</span>', except movement is backward."</span>
    (interactive `(,@(hlt-region-or-buffer-limits) nil ,current-prefix-arg))
    (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                               (setq start  (car start-end)
                                     end    (cadr start-end))))
    (hlt-next-highlight start end face mouse-p t no-error-p))

  (<span class="keyword">defun</span> <span class="function">hlt-highlight-faces-in-buffer</span> (start end)
    <span class="string">"List of highlighting faces in current buffer between START and END.
This includes faces used in overlays and as text properties.
Only highlighting faces are included, that is, faces associated with a
`<span class="constant important">hlt-highlight</span>' property."</span>
    (<span class="keyword elisp">save-excursion</span>
      (<span class="keyword elisp">save-window-excursion</span>
        (<span class="keyword elisp">let</span> ((faces  ())
              (beg  start)
              face)
          (setq end  (min end (point-max)))
          (goto-char beg)
          (<span class="keyword elisp">while</span> (&lt; beg end)
            (<span class="keyword elisp">save-restriction</span>
              (narrow-to-region beg end)
              (setq beg  (goto-char (next-single-char-property-change (point) 'face
                                                                      nil (point-max)))))
            (<span class="keyword cl">when</span> (setq face  (get-text-property (point) 'hlt-highlight))
              (add-to-list 'faces face))
            (<span class="keyword elisp">let</span> ((overlays  (overlays-at (point))))
              (<span class="keyword elisp">while</span> overlays
                (<span class="keyword cl">when</span> (and (overlay-get (car overlays) 'hlt-highlight)
                           (setq face  (overlay-get (car overlays) 'face)))
                  (add-to-list 'faces face)
                  (setq overlays  ()))
                (<span class="keyword cl">when</span> overlays (setq overlays  (cdr overlays))))))
          faces))))

  (<span class="keyword">defun</span> <span class="function">hlt-toggle-act-on-any-face-flag</span> ()
    <span class="string">"Toggle `<span class="constant important">hlt-act-on-any-face-flag</span>'."</span>
    (interactive)
    (setq hlt-act-on-any-face-flag  (not hlt-act-on-any-face-flag))
    (message (<span class="keyword elisp">if</span> hlt-act-on-any-face-flag
                 <span class="string">"Highlight actions now apply to any face, not just a highlighting face"</span>
               <span class="string">"Highlight actions now apply only to a highlighting face"</span>)))
  )
 
<span class="comment">;;(@* <span class="string">"Functions for Highlighting Propertized Text - Emacs 21+"</span>)</span>

<span class="comment">;;; Functions for Highlighting Propertized Text - Emacs 21+ ----------</span>

(<span class="keyword cl">when</span> (fboundp 'next-single-char-property-change) <span class="comment">; Don't bother, for Emacs 20.</span>
  (<span class="keyword">defun</span> <span class="function">hlt-highlight-property-with-value</span> (prop <span class="type">&amp;optional</span> values start end face
                                            type msg-p mouse-p)
    <span class="string">"Highlight text in region with property PROP of a value in VALUES.
Non-nil VALUES means do this only where PROP has a value in VALUES.
Interactively, you are prompted for PROP and VALUES.  For VALUES you
  can enter either a list or a single, non-list value.  A list is
  always interpreted as a list of values, not as a single list value.
  Using `<span class="constant important">RET</span>' with no input means highlight for any non-nil value.

With a prefix argument, use the `<span class="constant important">mouse-face</span>' property with FACE for
highlighting, not the `<span class="constant important">face</span>' property.

Optional args START and END are the limits of the area to act on.
  They default to the region limits (buffer, if no active region).
Optional 5th arg FACE is the face to use for highlighting.
  Interactively, this is the last face that was used for highlighting.
  (Use command `<span class="constant important">hlt-choose-default-face</span>' to choose a different face.)
Optional 6th arg TYPE is `<span class="constant important">overlay</span>', `<span class="constant important">text</span>', or nil, and specifies the
  type of property - nil means to look for both overlay and text
  properties.  Interactively, TYPE is derived from
  `<span class="constant important">hlt-use-overlays-flag</span>'.
Optional 7th arg MSG-P non-nil means to display a progress message.
Optional 8th arg MOUSE-P non-nil means use the `<span class="constant important">mouse-face</span>' property,
  not the `<span class="constant important">face</span>' property, for highlighting.  Interactively, MOUSE-P
  is provided by the prefix arg."</span>
    (interactive
     `(,(intern (read-string <span class="string">"Property to highlight: "</span> nil 'highlight-property-history))
       ,(<span class="keyword elisp">let</span>* ((strg  (read-string <span class="string">"Property value: "</span>))
               (vals  (<span class="keyword elisp">if</span> (string= <span class="string">""</span> strg)
                          ()
                        (car (read-from-string strg)))))
              (<span class="keyword cl">unless</span> (listp vals) (setq vals  (list vals)))
              vals)
       ,@(hlt-region-or-buffer-limits)
       nil
       ,(<span class="keyword elisp">if</span> hlt-use-overlays-flag
            (<span class="keyword elisp">if</span> (eq hlt-use-overlays-flag 'only) 'overlay nil)
            'text)
       t
       ,current-prefix-arg))
    (<span class="keyword cl">unless</span> (and start  end) (<span class="keyword elisp">let</span> ((start-end  (hlt-region-or-buffer-limits)))
                               (setq start  (car start-end)
                                     end    (cadr start-end))))
    (<span class="keyword elisp">if</span> face (setq hlt-last-face  face) (setq face  hlt-last-face))
    (<span class="keyword cl">when</span> (and msg-p  (or (hlt-nonempty-region-p)  mouse-p)) (message <span class="string">"Highlighting..."</span>))
    (<span class="keyword elisp">let</span> ((zone-end  nil))
      (<span class="keyword cl">unless</span> (and start  end)  (setq start  (point-min)
                                      end    (point-max)))
      (<span class="keyword elisp">condition-case</span> highlight-property-with-value
          (<span class="keyword elisp">save-excursion</span>
            (<span class="keyword elisp">while</span> (and (&lt; start end)
                        (<span class="keyword elisp">let</span>* ((charval  (and (or (not type)  (eq type 'overlay))
                                              (get-char-property start prop)))
                               (textval  (and (or (not type)  (eq type 'text))
                                              (get-text-property start prop)))
                               (currval  (hlt-flat-list charval textval)))
                          (<span class="keyword elisp">if</span> values
                              (not (hlt-set-intersection values currval))
                            (not currval))))
              (setq start  (next-single-char-property-change start prop nil end)))
            (<span class="keyword elisp">while</span> (and start  (&lt; start end))
              (setq zone-end  (or (next-single-char-property-change start prop nil end)
                                  end))
              (hlt-highlight-region start zone-end face nil mouse-p)
              (setq start  zone-end)
              (<span class="keyword elisp">while</span> (and (&lt; start end)
                          (<span class="keyword elisp">let</span>* ((charval  (and (or (not type)  (eq type 'overlay))
                                                (get-char-property start prop)))
                                 (textval  (and (or (not type)  (eq type 'text))
                                                (get-text-property start prop)))
                                 (currval  (hlt-flat-list charval textval)))
                            (<span class="keyword elisp">if</span> values
                                (not (hlt-set-intersection values currval))
                              (not currval))))
                (setq start  (next-single-char-property-change start prop nil end)))))
        (quit (hlt-unhighlight-region start end face))
        (<span class="warning">error</span> (hlt-unhighlight-region start end face)
               (<span class="warning">error</span> (<span class="warning">error</span>-message-string highlight-property-with-value)))))
    (<span class="keyword elisp">let</span> ((remove-msg  (substitute-command-keys
                        <span class="string">"`\\[<span class="constant important">universal-argument</span>] \\[<span class="constant important">hlt-highlight</span>]' to remove highlighting"</span>)))
      (<span class="keyword cl">when</span> (and msg-p  (or (hlt-nonempty-region-p)  mouse-p))
        (message <span class="string">"Highlighting... done. %s"</span> remove-msg))))

  (<span class="keyword">defun</span> <span class="function">hlt-flat-list</span> (val1 val2)
    <span class="string">"Return a flat list with all values in VAL1 and VAL2."</span>
    (<span class="keyword elisp">let</span> ((result  ()))
      (<span class="keyword cl">unless</span> (listp val1) (setq val1  (list val1)))
      (<span class="keyword cl">unless</span> (listp val2) (setq val2  (list val2)))
      (<span class="keyword elisp">while</span> val1 (add-to-list 'result (pop val1)))
      (<span class="keyword elisp">while</span> val2 (add-to-list 'result (pop val2)))
      result))

  (<span class="keyword">defun</span> <span class="function">hlt-mouse-toggle-link-highlighting</span> ()
    <span class="string">"Alternately highlight and unhighlight links on a mouse click.
Do nothing if the click is at a different location from the last one.
This calls `<span class="constant important">hlt-toggle-link-highlighting</span>' to do the toggling.
Links in the entire buffer are affected, even if the region is active.
This is intended to be used on `<span class="constant important">post-command-hook</span>'."</span>
    (<span class="keyword cl">when</span> (and (string-match <span class="string">"mouse"</span> (format <span class="string">"%S"</span> (event-basic-type last-command-event)))
               (memq 'click (event-modifiers last-command-event)))
      (<span class="keyword elisp">let</span>* ((estart  (event-start last-command-event))
             (pos     (copy-marker (posn-point estart))))
        (<span class="keyword cl">when</span> (integer-or-marker-p pos)
          (<span class="keyword elisp">save-excursion</span>
            (<span class="keyword elisp">with-current-buffer</span> (window-buffer (posn-window estart))
              (<span class="keyword cl">when</span> (<span class="keyword elisp">condition-case</span> nil
                        (get-char-property (min pos (point-max)) 'mouse-face)
                      (<span class="warning">error</span> nil))
                (hlt-toggle-link-highlighting nil nil pos))))))))

  <span class="comment">;; Use it like this:</span>
  <span class="comment">;; (add-hook 'post-command-hook 'hlt-mouse-toggle-link-highlighting)</span>

  (<span class="keyword">defun</span> <span class="function">hlt-toggle-link-highlighting</span> (<span class="type">&amp;optional</span> start end pos)
    <span class="string">"Alternately highlight and unhighlight links.
A link is considered to be any text with property `<span class="constant important">mouse-face</span>'.
Calls `<span class="constant important">hlt-toggle-property-highlighting</span>', passing the args."</span>
    (interactive `(,@(hlt-region-or-buffer-limits)))
    (hlt-toggle-property-highlighting 'mouse-face start end 'hlt-property-highlight
                                      (interactive-p) nil pos))

  (<span class="keyword">defun</span> <span class="function">hlt-mouse-toggle-property-highlighting</span> (prop <span class="type">&amp;optional</span> face msg-p mouse-p)
    <span class="string">"Alternately highlight and unhighlight text on a mouse click.
Do nothing if the click is at a different location from the last one.
Call `<span class="constant important">hlt-toggle-link-highlighting</span>', passing the args.
Propertized text in the entire buffer is (un)highlighted, even if the
region is active.
This is intended to be used on `<span class="constant important">post-command-hook</span>'."</span>
    (<span class="keyword cl">when</span> (and (string-match <span class="string">"mouse"</span> (format <span class="string">"%S"</span> (event-basic-type last-command-event)))
               (memq 'click (event-modifiers last-command-event)))
      (<span class="keyword elisp">let</span>* ((estart  (event-start last-command-event))
             (pos     (copy-marker (posn-point estart))))
        (<span class="keyword cl">when</span> (integer-or-marker-p pos)
          (<span class="keyword elisp">save-excursion</span>
            (<span class="keyword elisp">with-current-buffer</span> (window-buffer (posn-window estart))
              (<span class="keyword cl">when</span> (<span class="keyword elisp">condition-case</span> nil
                        (get-char-property (min pos (point-max)) prop)
                      (<span class="warning">error</span> nil))
                (hlt-toggle-property-highlighting prop nil nil
                                                  face (interactive-p) mouse-p pos))))))))

  <span class="comment">;; Use it like this:</span>
  <span class="comment">;; (add-hook 'post-command-hook</span>
  <span class="comment">;;           (<span class="keyword elisp">lambda</span> () (hlt-mouse-toggle-property-highlighting myprop myface)</span>

  (<span class="keyword">defun</span> <span class="function">hlt-toggle-property-highlighting</span> (prop <span class="type">&amp;optional</span> start end face
                                           msg-p mouse-p pos)
    <span class="string">"Alternately highlight/unhighlight all text that has property PROP.
Highlighting is done using overlays.

With a prefix argument, use the `<span class="constant important">mouse-face</span>' property with FACE for
highlighting, not the `<span class="constant important">face</span>' property.

Optional arg POS is a buffer position.  If it is the same as the
  position recorded in `<span class="constant important">hlt-prop-highlighting-state</span>', then do not
  toggle.  In any case, update `<span class="constant important">hlt-prop-highlighting-state</span>' with POS.
Other args are the same as for `<span class="constant important">hlt-highlight-property-with-value</span>'."</span>
    (interactive
     `(,(intern (read-string <span class="string">"Property to highlight: "</span> nil 'highlight-property-history))
       ,@(hlt-region-or-buffer-limits)
       nil  t  ,current-prefix-arg))
    (<span class="keyword cl">when</span> (or (not pos)  (equal pos (cdr hlt-prop-highlighting-state)))
      (<span class="keyword elisp">cond</span> ((car hlt-prop-highlighting-state)
             (hlt-unhighlight-all-prop prop start end face (interactive-p) mouse-p)
             (setcar hlt-prop-highlighting-state  nil))
            (t
             (hlt-highlight-all-prop prop start end face (interactive-p) mouse-p)
             (setcar hlt-prop-highlighting-state t))))
    (<span class="keyword cl">when</span> pos (setcdr hlt-prop-highlighting-state  pos)))

  (<span class="keyword">defun</span> <span class="function">hlt-highlight-all-prop</span> (prop <span class="type">&amp;optional</span> start end face msg-p mouse-p)
    <span class="string">"Highlight all text that has a non-nil property PROP using FACE.
Highlight using overlays.
Args are the same as for `<span class="constant important">hlt-highlight-property-with-value</span>'."</span>
    (interactive `(,@(hlt-region-or-buffer-limits)))
    (hlt-highlight-property-with-value
     prop () start end face 'overlay (interactive-p) mouse-p))

  (<span class="keyword">defun</span> <span class="function">hlt-unhighlight-all-prop</span> (prop <span class="type">&amp;optional</span> start end face msg-p mouse-p)
    <span class="string">"Unhighlight all text highlighted with face `<span class="constant important">hlt-property-highlight</span>'.
Args are the same as for `<span class="constant important">hlt-highlight-property-with-value</span>'."</span>
    (interactive `(,@(hlt-region-or-buffer-limits)))
    (<span class="keyword elisp">let</span> ((hlt-use-overlays-flag  'only))
      (hlt-unhighlight-region-for-face face start end mouse-p)))

  )
 
<span class="comment">;;(@* <span class="string">"General functions"</span>)</span>

<span class="comment">;;; General functions</span>

<span class="comment">;; This is the same as `<span class="constant important">region-or-buffer-limits</span>' in `misc-fns.el'.</span>
(<span class="keyword">defun</span> <span class="function">hlt-region-or-buffer-limits</span> ()
  <span class="string">"Return the start and end of the region as a list, smallest first.
If the region is empty or not active, then bob and eob are used."</span>
  (<span class="keyword elisp">if</span> (not (hlt-nonempty-region-p))
      (list (point-min) (point-max))
    (<span class="keyword elisp">if</span> (&lt; (point) (mark)) (list (point) (mark)) (list (mark) (point)))))

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;</span>

(<span class="keyword">provide</span> '<span class="constant">highlight</span>)

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;; highlight.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=highlight.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local edit" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_highlight.el">Talk</a> <a class="password" rel="nofollow" href="http://www.emacswiki.org/emacs?action=password">This page is read-only</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=highlight.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=highlight.el">Administration</a></span><span class="time"><br /> Last edited 2014-02-26 21:07 UTC by <a class="author" title="inet-hqmc02-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=highlight.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
