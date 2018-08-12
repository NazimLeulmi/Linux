fLyMd-mAkEr
# Table of Contents

1.  [what is org-mode ?](#orgb77e188)
2.  [org-mode features](#orge7694b8)
3.  [Markup](#org23117f8)
        1.  [Text Transformations](#orgba4d899)
        2.  [Links [[address][description]\\]](#orgd932d92)
        3.  [Smarter Tables](#orgc20089e)
4.  [Export to other formats from the same source](#orgea05fb0)


<a id="orgb77e188"></a>

# what is org-mode ?

-   Its a a system within emacs for organizing notes and tasks.
-   Org-mode is an example of an exocortex.
-   Something to rely on other than your brain to remember things.


<a id="orge7694b8"></a>

# org-mode features

-   Get organized and stop forgetting things
-   Maintain focus on the task
-   Outlining , with easy folding 'tab' 
    -   helps with maintaining focus
-   Task management & to-do lists 't'
    -   task uno
    -   2nd task
    -   3rd  task
    -

Progress indicators <code>[0/0]</code>
TODO task uno
DONE 2nd task 
    CLOSED: <span class="timestamp-wrapper"><span class="timestamp">[2018-08-06 Mon 19:27]</span></span>
DONE 3rd  task
    CLOSED: <span class="timestamp-wrapper"><span class="timestamp">[2018-08-06 Mon 19:27]</span></span>
Percentage progress indicator <code>[0%]</code>
DONE task uno
    CLOSED: <span class="timestamp-wrapper"><span class="timestamp">[2018-08-06 Mon 19:29]</span></span>
DONE 3rd task 
    CLOSED: <span class="timestamp-wrapper"><span class="timestamp">[2018-08-06 Mon 19:29]</span></span>
DONE 2nd task 
    CLOSED:  A table consists of a rectangular text are
CA
9+
a which is divided inox-gfmto cells. Each cell must be at least onox-gfme character wide and one character high, not counting its border lines. A cell can be subdivided into more cells, but they cannot overlap. <span class="timestamp-wrapper"><span class="timestamp">[2018-08-06 Mon 19:29]</span></span>
TODO 2nd task 
TODO 2nd task 
Scheduling and working with an agenda 

-   lets write some text
    -   barber
    -   shopping
    -   dog walk


<a id="org23117f8"></a>

# Markup


<a id="orgba4d899"></a>

### Text Transformations

-   *italic* text
-   **bold** text
-   `verbatim`
-   <del>stroke through</del> text


<a id="orgd932d92"></a>

### Links [[address][description]\\]

-   C-c + C-l to create a link automatically
-   HTTP links
    [my github](https://github.com//ryanLeulmi)
-   Local Links to files / todos / files / etc..
    [dotspacemacs](file:///home/ryan/.spacemacs)
-   C-c + C-o to open a local link in a new buffer


<a id="orgc20089e"></a>

### Smarter Tables

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Student #</th>
<th scope="col" class="org-left">Email</th>
<th scope="col" class="org-left">Password</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">ryan</td>
<td class="org-left">ryanleulmi@gmail.com</td>
<td class="org-left">1234</td>
</tr>


<tr>
<td class="org-left">student</td>
<td class="org-left">another one</td>
<td class="org-left">asd21</td>
</tr>
</tbody>
</table>


<a id="orgea05fb0"></a>

# Export to other formats from the same source

-   C-c + C-e

