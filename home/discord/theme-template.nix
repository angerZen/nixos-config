{
  xdg.configFile."Vencord/settings/pywal-discord.css".text = ''
    /**  colors will come from .cache/wal/colors.css as variables defined in :root
     *  see: cat $HOME/.cache/wal/colors.css
    */

    /* firends page */
    .peopleList-2VBrVI, .inner-2pOSmK {
        background: var(--background);
    }


    {
        font-family: "Comfortaa";
    }


    .peopleColumn-1wMU14{
        background: var(--color0);
    }

    element {
      font-size: 100%;
    }

    /* end element */
    :root {
      /* Yeah, I know lightbg is actually darker than darkbg but whatever
         * change & pull it if you wish */
      --lightbg: linear-gradient(rgba(255, 255, 255, 0.06),
          rgba(255, 255, 255, 0.06)),
        var(--background);
      --darkbg: linear-gradient(rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.1)),
        var(--background);
      --bdfdb-blurple: var(--color1);
    }

    html.newBrand {
      --brand-experiment-100: var(--text);
      --brand-experiment-130: var(--text);
      --brand-experiment-160: var(--text);
      --brand-experiment-200: var(--text);
      --brand-experiment-230: var(--text);
      --brand-experiment-260: var(--text);
      --brand-experiment: var(--color1);
      --brand-experiment-300: var(--color1);
      --brand-experiment-330: var(--color1);
      --brand-experiment-360: var(--color1);
      --brand-experiment-400: var(--color1);
      --brand-experiment-430: var(--color1);
      --brand-experiment-460: var(--color1);
      --brand-experiment: var(--color1);
      --brand-experiment-500: var(--color1);
      --brand-experiment-530: var(--color1);
      --brand-experiment-560: var(--color1);
      --brand-experiment-600: var(--color1);
      --brand-experiment-630: var(--color1);
      --brand-experiment-660: var(--color8);
      --brand-experiment-700: var(--color8);
      --brand-experiment-730: var(--color8);
      --brand-experiment-760: var(--color8);
      --brand-experiment-800: var(--background);
      --brand-experiment-830: var(--background);
      --brand-experiment-860: var(--background);
      --brand-experiment-900: var(--background);
    }

    .theme-dark {
      --brand-experiment: var(--color1);
      --text-positive var(--color2);
      --header-primary: var(--foreground);
      --header-secondary: var(--color7);
      --text-normal: var(--color7);
      --text-muted: var(--color7);
      --text-link: var(--color12);
      --channels-default: var(--foreground);
      --interactive-normal: var(--foreground);
      --interactive-hover: var(--foreground);
      --interactive-active: var(--foreground);
      --interactive-muted: var(--color7);
      --background-primary: var(--background);
      --background-secondary: var(--lightbg);
      --background-secondary-alt: var(--darkbg);
      --background-tertiary: var(--background);
      --background-accent: var(--background);
      --background-floating: var(--background);
      --background-mobile-primary: var(--background);
      --background-mobile-secondary: var(--color8);
      --background-modifier-hover: rgba(79, 84, 92, 0.16);
      --background-modifier-active: rgba(79, 84, 92, 0.24);
      --background-modifier-selected: rgba(79, 84, 92, 0.32);
      --background-modifier-accent: hsla(0, 0%, 100%, 0.06);
      --background-mentioned: rgba(250, 166, 26, 0.05);
      --background-mentioned-hover: rgba(250, 166, 26, 0.08);
      --background-message-hover: rgba(4, 4, 5, 0.07);
      --elevation-stroke: 0 0 0 1px rgba(4, 4, 5, 0.15);
      --elevation-low: 0 1px 0 rgba(4, 4, 5, 0.2), 0 1.5px 0 rgba(6, 6, 7, 0.05),
        0 2px 0 rgba(4, 4, 5, 0.05);
      --elevation-medium: 0 4px 4px rgba(0, 0, 0, 0.16);
      --elevation-high: 0 8px 16px rgba(0, 0, 0, 0.24);
      --logo-primary: #fff;
      --guild-header-text-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
      --channeltextarea-background: var(--darkbg);
      --activity-card-background: var(--background);
      --textbox-markdown-syntax: var(--foreground);
      --deprecated-card-bg: rgba(32, 34, 37, 0.6);
      --deprecated-card-editable-bg: rgba(32, 34, 37, 0.3);
      --deprecated-store-bg: #36393f;
      --deprecated-quickswitcher-input-background: var(--color8);
      --deprecated-quickswitcher-input-placeholder: var(--color7);
      --deprecated-text-input-bg: rgba(0, 0, 0, 0.1);
      --deprecated-text-input-border: rgba(0, 0, 0, 0.3);
      --deprecated-text-input-border-hover: #040405;
      --deprecated-text-input-border-disabled: #202225;
      --deprecated-text-input-prefix: #dcddde;
      --scrollbar-thin-thumb: var(--color1);
      --scrollbar-auto-thumb: var(--color1);
      --scrollbar-auto-track: rgba(255, 255, 255, 0.06);
      --scrollbar-thin-track: rgba(255, 255, 255, 0.06);
      --text-positive: var(--color2);
      --text-warning: var(--color4);
      --text-danger: var(--color1);
      --info-positive-background: rgba(59, 165, 92, 0.1);
      --info-positive-foreground: var(--color2);
      --info-warning-background: rgba(250, 166, 26, 0.1);
      --info-warning-foreground: var(--color4);
      --info-danger-background: rgba(237, 66, 69, 0.1);
      --info-danger-foreground: var(--color1);
      --status-positive-background: var(--color2);
      --status-positive-text: var(--text);
      --status-warning-background: var(--color4);
      --status-danger-background: var(--color1);
    }

    /* end .theme-dark */

    .theme-light {
      --brand-experiment: var(--color1);
      --text-positive var(--color2);
      --header-primary: var(--color8);
      --header-secondary: var(--background);
      --text-normal: var(--background);
      --text-muted: var(--color8);
      --text-link: var(--color12);
      --channels-default: var(--background);
      --interactive-hover: var(--color8);
      --interactive-active: var(--color8);
      --interactive-muted: var(--color8);
      --background-primary: var(--color7);
      --background-secondary: var(--foreground);
      --background-secondary-alt: var(--foreground);
      --background-tertiary: var(--color7);
      --background-accent: var(--color7);
      --background-floating: var(--color7);
      --background-mobile-primary: var(--color7);
      --background-mobile-secondary: var(--foreground);
      --background-modifier-hover: rgba(79, 84, 92, 0.16);
      --background-modifier-active: rgba(79, 84, 92, 0.24);
      --background-modifier-selected: rgba(79, 84, 92, 0.32);
      --background-modifier-accent: hsla(0, 0%, 100%, 0.06);
      --background-mentioned: rgba(250, 166, 26, 0.05);
      --background-mentioned-hover: rgba(250, 166, 26, 0.08);
      --background-message-hover: rgba(4, 4, 5, 0.07);
      --elevation-stroke: 0 0 0 1px rgba(4, 4, 5, 0.15);
      --elevation-low: 0 1px 0 rgba(4, 4, 5, 0.2), 0 1.5px 0 rgba(6, 6, 7, 0.05),
        0 2px 0 rgba(4, 4, 5, 0.05);
      --elevation-medium: 0 4px 4px rgba(0, 0, 0, 0.16);
      --elevation-high: 0 8px 16px rgba(0, 0, 0, 0.24);
      --logo-primary: #fff;
      --guild-header-text-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
       --channeltextarea-background: var(--darkbg);
      --activity-card-background: var(--background);
      --textbox-markdown-syntax: var(--color8);
      --deprecated-card-bg: rgba(32, 34, 37, 0.6);
      --deprecated-card-editable-bg: rgba(32, 34, 37, 0.3);
      --deprecated-store-bg: #36393f;
      --deprecated-quickswitcher-input-background: var(--foreground);
      --deprecated-quickswitcher-input-placeholder: var(--color8);
      --deprecated-text-input-bg: rgba(0, 0, 0, 0.1);
      --deprecated-text-input-border: rgba(0, 0, 0, 0.3);
      --deprecated-text-input-border-hover: #040405;
      --deprecated-text-input-border-disabled: #202225;
      --deprecated-text-input-prefix: #dcddde;
      --scrollbar-thin-thumb: var(--color1);
      --scrollbar-auto-thumb: var(--color1);
      --scrollbar-auto-track: rgba(0, 0, 0, 0.1);
      --scrollbar-thin-track: rgba(0, 0, 0, 0.1);
      --text-positive: var(--color2);
      --text-warning: var(--color4);
      --text-danger: var(--color1);
      --info-positive-background: rgba(59, 165, 92, 0.1);
      --info-positive-foreground: var(--color2);
      --info-warning-background: rgba(250, 166, 26, 0.1);
      --info-warning-foreground: var(--color4);
      --info-danger-background: rgba(237, 66, 69, 0.1);
      --info-danger-foreground: var(--color1);
      --status-positive-background: var(--color2);
      --status-positive-text: var(--text);
      --status-warning-background: var(--color4);
      --status-danger-background: var(--color1);
    }

    /* end .theme-light */

    /* Emoji picker body background */
    .emojiPickerInExpressionPicker-3IzIcv .emojiPicker-3PwZFl {
      background-color: var(--background);
    }

    /* Emoji picker header background */
    .contentWrapper-SvZHNd {
      background-color: var(--background);
    }

    /* Friends tab background */
    .theme-dark .container-1D34oG {
      background-color: var(--background);
    }

    /* User popout body */
    .theme-dark .body-3iLsc4,
    .theme-dark .footer-1fjuF6 {
      background-color: var(--background);
      opacity: 1 !important;
    }

    /* User popout header */
    .theme-dark .headerNormal-T_seeN {
      background-color: var(--background);
    }

    /* Bottom part of user popout */
    .body-3ND3kc {
      opacity: 1.0 !important;
      background-color: var(--color0) !important;
    }

    /* User popout header when playing a game */
    .headerPlaying-j0WQBV,
    .headerFill-adLl4x,
    .activityProfile-2bJRaP,
    .activity-1ythUs,
    .header-QKLPzZ {
      background: var(--color1);
    }

    /* Start rebranding gross yuck */
    .lookFilled-1Gx00P.colorBrand-3pXr91 {
      color: var(--text);
      background-color: var(--color1);
    }

    .lookFilled-1Gx00P.colorGreen-29iAKY {
      color: var(--text);
      background-color: var(--color2);
    }

    .lookFilled-1Gx00P.colorRed-1TFJan {
      color: var(--text);
      background-color: var(--color3);
    }

    .lookFilled-1Gx00P.colorBrand-3pXr91:disabled {
      background-color: var(--color1);
    }

    .botTagRegular-2HEhHi {
      background: var(--color1);
      color: var(--text);
    }

    .theme-dark .wrapper-3WhCwL {
      background: var(--darkbg);
      color: var(--text);
    }

    .reaction-1hd86g.reactionMe-wv5HKu {
      background-color: var(--background);
      border-color: var(--color4);
    }

    .newMessagesBar-265mhP {
      top: 0;
      border-radius: 0 0 8px 8px;
      background-color: var(--color2);
      -webkit-box-shadow: var(--elevation-low);
      box-shadow: var(--elevation-low);
    }

    .rtcConnectionStatusConnected-VRZDjy,
    .rtcConnectionQualityFine-2J6i8z,
    .pingForeground-2uAOZ3 {
      color: var(--color2);
    }

    .lookFilled-1Gx00P.colorYellow-2JqYwt {
      color: var(--text);
      background-color: var(--color4);
    }

    /* End rebranding gross yuck */


    /* Tab underneath users in the Active Now tab on the friends page */
    .theme-dark .inset-3sAvek {
      background-color: rgba(255, 255, 255, 0.06);
    }

    /* Edit buttons in the settings page */
    .lookFilled-1Gx00P.colorGrey-2DXtkV {
      color: #fff;
      background-color: var(--color1);
    }


    .scroller-2FKFPG.sidebarRegionScroller-3MXcoP {
      /* Settings */
      background: var(--darkbg);
    }

    /* end of settings */

    html body {

      .appMount-3lHmkl,
      body,
      html {
        height: 100%;
        width: 100%;
      }

      /* end .appMount-3lHmkl, body, html */

      a,
      abbr,
      acronym,
      address,
      applet,
      big,
      blockquote,
      body,
      caption,
      cite,
      code,
      dd,
      del,
      dfn,
      div,
      dl,
      dt,
      em,
      fieldset,
      form,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      html,
      iframe,
      img,
      ins,
      kbd,
      label,
      legend,
      li,
      object,
      ol,
      p,
      pre,
      q,
      s,
      samp,
      small,
      span,
      strike,
      strong,
      table,
      tbody,
      td,
      tfoot,
      th,
      thead,
      tr,
      tt,
      ul,
      var {
        margin: 0;
        padding: 0;
        border: 0;
        font-weight: inherit;
        font-style: inherit;
        font-family: inherit;
        font-size: 100%;
        vertical-align: baseline;
      }

      /* end a, abbr, acronym, address, applet, big, blockquote, body, caption, cite, code, dd, del, dfn, div, dl, dt, em, fieldset, form, h1, h2, h3, h4, h5, h6, html, iframe, img, ins, kbd, label, legend, li, object, ol, p, pre, q, s, samp, small, span, strike, strong, table, tbody, td, tfoot, th, thead, tr, tt, ul, var */

      element {}

      /* end element */

      ::placeholder,
      body,
      button,
      input,
      select,
      textarea {
        font-family: Fira Sans, Whitney, Helvetica Neue, Helvetica, Arial,
          sans-serif;
        text-rendering: optimizeLegibility;
      }

      /* end ::placeholder, body, button, input, select, textarea */

      ::placeholder,
      body,
      button,
      input,
      select,
      textarea {
        font-family: Fira Sans, Whitney, Helvetica Neue, Helvetica, Arial,
          sans-serif;
        text-rendering: optimizeLegibility;
      }

      /* end ::placeholder, body, button, input, select, textarea */

      ::-webkit-input-placeholder,
      body,
      button,
      input,
      select,
      textarea {
        font-family: Fira Sans, Whitney, Helvetica Neue, Helvetica, Arial,
          sans-serif;
        text-rendering: optimizeLegibility;
      }

      /* end ::-webkit-input-placeholder, body, button, input, select, textarea */
    }

    /* end body */

    html body div#app-mount.appMount-3lHmkl {
      element {}

      /* end element */

      .appMount-3lHmkl,
      body {
        background-color: var(--background-tertiary);
        text-rendering: optimizeLegibility;
      }

      /* end .appMount-3lHmkl, body */

      .appMount-3lHmkl,
      body,
      html {
        height: 100%;
        width: 100%;
      }

      /* end .appMount-3lHmkl, body, html */

      body {
        line-height: 1;
        margin: 0;
        padding: 0;
        font-family: Fira Sans, Whitney, Helvetica Neue, Helvetica, Arial,
          sans-serif;
        overflow: hidden;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        background: transparent;
        background-color: transparent;
      }

      /* end body */

      a,
      abbr,
      acronym,
      address,
      applet,
      big,
      blockquote,
      body,
      caption,
      cite,
      code,
      dd,
      del,
      dfn,
      div,
      dl,
      dt,
      em,
      fieldset,
      form,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      html,
      iframe,
      img,
      ins,
      kbd,
      label,
      legend,
      li,
      object,
      ol,
      p,
      pre,
      q,
      s,
      samp,
      small,
      span,
      strike,
      strong,
      table,
      tbody,
      td,
      tfoot,
      th,
      thead,
      tr,
      tt,
      ul,
      var {
        margin: 0;
        padding: 0;
        border: 0;
        font-weight: inherit;
        font-style: inherit;
        font-family: inherit;
        font-size: 100%;
        vertical-align: baseline;
      }

      /* end a, abbr, acronym, address, applet, big, blockquote, body, caption, cite, code, dd, del, dfn, div, dl, dt, em, fieldset, form, h1, h2, h3, h4, h5, h6, html, iframe, img, ins, kbd, label, legend, li, object, ol, p, pre, q, s, samp, small, span, strike, strong, table, tbody, td, tfoot, th, thead, tr, tt, ul, var */

      a,
      button,
      div,
      input,
      select,
      span,
      strong,
      textarea {
        outline: 0;
      }

      /* end a, button, div, input, select, span, strong, textarea */

      a,
      abbr,
      acronym,
      address,
      applet,
      big,
      blockquote,
      body,
      caption,
      cite,
      code,
      dd,
      del,
      dfn,
      div,
      dl,
      dt,
      em,
      fieldset,
      form,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      html,
      iframe,
      img,
      ins,
      kbd,
      label,
      legend,
      li,
      object,
      ol,
      p,
      pre,
      q,
      s,
      samp,
      small,
      span,
      strike,
      strong,
      table,
      tbody,
      td,
      tfoot,
      th,
      thead,
      tr,
      tt,
      ul,
      var {
        margin: 0;
        padding: 0;
        border: 0;
        font-weight: inherit;
        font-style: inherit;
        font-family: inherit;
        font-size: 100%;
        vertical-align: baseline;
      }

      /* end a, abbr, acronym, address, applet, big, blockquote, body, caption, cite, code, dd, del, dfn, div, dl, dt, em, fieldset, form, h1, h2, h3, h4, h5, h6, html, iframe, img, ins, kbd, label, legend, li, object, ol, p, pre, q, s, samp, small, span, strike, strong, table, tbody, td, tfoot, th, thead, tr, tt, ul, var */
    }

    /* end body div#app-mount.appMount-3lHmkl */

    .avatarSpeaking-2pCGrZ {
      /* fix speaking indicator */
      -webkit-box-shadow: inset 0 0 0 2px var(--foreground),
        inset 0 0 0 3px var(--background-secondary);
      box-shadow: inset 0 0 0 2px var(--foreground), inset 0 0 0 3px;
    }

  '';
  xdg.configFile."Vencord/settings/meta.css".text = ''
    /**
     * @name Pywal-Discord
     * @author contributors to https://github.com/FilipLitwora/pywal-discord
     * @version 0.0.2
     * @Genrate discord theme by pywal color palette
     * @source https://github.com/FilipLitwora/pywal-discord
     * @website https://github.com/FilipLitwora/pywal-discord
    */

  '';
}