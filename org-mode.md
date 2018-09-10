- [what is org-mode ?](#sec-)
- [org-mode features](#sec-)
    - [To do lists must be headers](#sec-)
    - [Progress indicators <code>[2/3]</code>](#sec-)
    - [Percentorg mode age indicators <code>[75%]</code>](#sec-)
- [Markup](#sec-)
    - [Text Transformations](#sec-)
    - [Meta Data](#sec-)
    - [Links `[[address][description]]`](#sec-)
    - [Source Code](#sec-)
    - [Raw HTML export](#sec-)
    - [Smarter Tables](#sec-)
- [Export to other formats from the same source](#sec-)

# what is org-mode ?<a id="sec-"></a>

-   It is a mode within emacs that started its life as an outliner .
-   org mode is usually used as a markup language to write notes ,to do lists , and much more.
-   It is an example of an exocortex , which is something to rely on other than your brain to remember things.

# org-mode features<a id="sec-"></a>

-   Easy outlining with `tab` folding to maximize focus on the task.
-   Task management & to-do lists with different states
    -   `t` to cycle through the different states of the list item.

### To do lists must be headers<a id="sec-"></a>

-   DONE task uno

-   TODO 2nd task

-   TODO 3rd  task

### Progress indicators <code>[2/3]</code><a id="sec-"></a>

-   TODO barber

-   DONE walk dog

-   DONE launch

### Percentorg mode age indicators <code>[75%]</code><a id="sec-"></a>

-   DONE wash car

-   DONE cook dinner

-   TODO run

-   DONE shower

# Markup<a id="sec-"></a>

### Text Transformations<a id="sec-"></a>

-   *italic* text
-   **bold** text
-   `verbatim`
-   ~~stroke through~~ text

### Meta Data<a id="sec-"></a>

-   Title
-   Options [disable/enable] features

### Links `[[address][description]]`<a id="sec-"></a>

-   C-c + C-l to create a link automatically
-   HTTP links [my github](https://github.com//ryanLeulmi)
-   Local Links to files / todos / files / etc.. [dotspacemacs](file:///home/ryan/.spacemacs)
-   C-c + C-o to open a local link in a new buffer

### Source Code<a id="sec-"></a>

-   `<s + tab` to create a code block
-   `C-c + '` to open a code block in a new buffer with it's mode

```bash
export PATH="`yarn global bin`:$PATH"
```

### Raw HTML export<a id="sec-"></a>

```org
#+BEGIN_EXPORT html
<h3> RAW HTML </h3>
#+END_EXPORT
```

### Smarter Tables<a id="sec-"></a>

| Student # | Email                | Password |
|--------- |-------------------- |-------- |
| ryan      | ryanleulmi@gmail.com | 1234     |
| student   | another one          | asd21    |

# Export to other formats from the same source<a id="sec-"></a>

-   C-c + C-e
-   twitter bootstrap `ox-twbs`
-   html , pdf , markdown `ox-gfm`
-   `org-export-backends` to manage your export backends.
-   `org-file-apps` to change which apps your export backends use.
