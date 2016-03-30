---
layout: post
title: "Cool Problem: License Plates Differ In At Least Two Places"
date: 2016-03-18 23:22:00 -0400
tags: [math, combinatorics]
---

<http://artofproblemsolving.com/community/c1590h1015789s3_problem_6_1990_usamo_1>

<https://www.artofproblemsolving.com/wiki/index.php?title=1990_USAMO_Problems/Problem_1>

> Problem: A certain state issues license plates consisting of six digits (from 0 to 9). The state requires that any two license plates differ in at least two places. (For instance, the numbers 027592 and 020592 cannot both be used.) Determine, with proof, the maximum number of distinct license plates that the state can use.  

After having to give up on this seemingly simple counting problem, I decided to write an explanation to my future self.

## Analysis
How big can we make a pool of plates where every plate has 2, 3, 4, 5, or 6 differences? A natural tendency is to count all possible plates (10^6) and subtract the plates with 1 or 0 differences. We can ignore zero differences because any plate has no counterpart with 0 differences. But counting the plates with one difference between them is actually very difficult.

The problem is that there are different ways to decide which plates are the keepers, and which are the "copies" (the other plates differing at 1 position). For instance if I decide that 000000 is a keeper, then 000001, 000002, 000003, and so on become copies. But if I first decide that 000001 is a keeper, then 000000 must be thrown out.

If I choose two keepers, and they disclude mostly the same plates, it seems to be a more optimal choice than them discluding disjoint plates. Indeed, if my goal is to maximize the number of keepers, then my choice in selecting keepers makes a big difference in the outcome.

To demonstrate, let's suppose that instead of the 10 symbol digits in the problem description, we have only 4 symbols, call them A, B, C, D. And instead of a symbol length of 6, we have a reduced symbol length of 3. While the original problem counts 000001, 0000002, 000003 and so on, our smaller example will count AAA, AAB, AAC and so on. Our smaller example has 4<sup>3</sup>=64 plates.

We will include plates DCA, CBC, ACD, CAB, ABB, BAA, ADC, BDD, DDB, DAD, BCC, CDA. With those 12 choices, we disclude the other 52 plates It seems an inefficient choice. To illustrate, here is an undirect graph where each vertex is connected to another when separated by only one position change. Green nodes are the ones included, and red ones are discluded. Obviously no green node can touch a red node.

![graph](/assets/bad_graph.png)

The full details are of the choices are:

    inclusion of DCA discludes DCB CCA DBA DCC DDA DCD ACA BCA DAA
    inclusion of CBC discludes BBC CDC CBD CCC CBA CBB ABC CAC DBC
    inclusion of ACD discludes ABD AAD ACB ACC BCD CCD ADD
    inclusion of CAB discludes BAB DAB CCB CAA CAD CDB AAB
    inclusion of ABB discludes ABA ADB DBB BBB 
    inclusion of BAA discludes AAA BBA BAC BDA BAD
    inclusion of ADC discludes ADA DDC BDC AAC 
    inclusion of BDD discludes CDD DDD BDB BBD 
    inclusion of DDB discludes 
    inclusion of DAD discludes DBD DAC 
    inclusion of BCC discludes BCB
    inclusion of CDA discludes 

Now let's include the plates AAA, ABB, ACC, ADD, BAB, BBA, BCD, BDC, CAC, CBD, CCA, CDB, DAD, DBC, DCB, DDA. Here we have 16 plates included, discluding only 48:

![graph](/assets/good_graph.png)

Here's the transcript of these choices:

    inclusion of AAA discludes AAB AAC AAD ABA ACA ADA BAA CAA DAA
    inclusion of ABB discludes ABC ABD ACB ADB BBB CBB DBB
    inclusion of ACC discludes ACD ADC BCC CCC DCC
    inclusion of ADD discludes BDD CDD DDD
    inclusion of BAB discludes BAC BAD BCB BDB CAB DAB
    inclusion of BBA discludes BBC BBD BCA BDA CBA DBA
    inclusion of BCD discludes CCD DCD
    inclusion of BDC discludes CDC DDC
    inclusion of CAC discludes CAD CBC DAC
    inclusion of CBD discludes DBD
    inclusion of CCA discludes CCB CDA DCA
    inclusion of CDB discludes DDB
    inclusion of DAD discludes 
    inclusion of DBC discludes 
    inclusion of DCB discludes 
    inclusion of DDA discludes

Notice that on the second choice ABB, two plates that would have been eliminated were already gone due to the first choice AAA. Also, the last four choices didn't eliminate anything.

## Solution
The two problem URLs contain also the solution, but the second one is much better explained. It's a nice argument that comes in two parts, and is worth paraphrasing here:

### establish an upper bound
The actual amount of keeper plates may be less than this, but we can say for sure that it's no more than 10<sup>5</sup>. That's because we can find unique assignments for the first 5 digits by simply counting 00000, 00001, 00002, and so on. If we go beyond 99999, we're forced to reuse one of the previous assignments, which would leave room for only one digit (the 6th position) to differ, grounds for disclusion!

For example, suppose after generating the 10<sup>5</sup> plates we generate one more, say 27342. We now have two partially completed plates starting with 27342 and must ask ourselves how to assign the 6th digit. If we assign both the same digit, then we're dealing with the same single plate. If we assign both different digits, then one must be discarded as they differ by only one position.

So the best we can hope for is 10<sup>5</sup>, but it might be less.

### construct a strategy that reaches the upper bound
Before we decrease the bound, what if we had a strategy of assigning the 6'th digit that guaranteed two position difference among the 10<sup>5</sup> partial plates we've made so far?

We do. The 6th digit can be chosen as the sum of the first five digits modulo 10.

If there are more than 2 differences in the first five digits, then the criteria for keeping plates is already met and it doesn't matter how the last digit is chosen.

If there is exactly 1 difference in the first five digits, then the sum of the first five digits modulo 10 is at most 9, and our assignment is guaranteed to produce a 2nd difference in the 6th position.

There cannot be 0 differences in the first five digits because we constructed them as a count from 00000 to 99999.

## Appendix

### generating graphs

The following python script generated the .dot file which was fed to fdp from graphviz which output a .pdf which I viewed and took a screenshot of.

~~~ python
#!/usr/bin/env python

import re
import sys
import random
import itertools

count = 0

edges = {}
deleted = {}

def dist(left, right):
    if(type(left) == type(right) == type(1)):
        left = int(left)
        right = int(right)

    if len(left) != len(right):
        raise Exception("comparing %s to %s" % (left, right))

    dist = 0
    for i in range(len(left)):
        if left[i] != right[i]:
            dist += 1

    return dist

symList = 'ABCD'
nodeLen = 3 

allNodes = [''.join(x) for x in itertools.product(symList, repeat=nodeLen)]
#random.shuffle(allNodes)
for a in allNodes:
    for b in allNodes:
        d = dist(a,b)

        if d == 1:
            # add edge (sorted, into dict to avoid double edge)
            tmp = '"%s" -- "%s"' % tuple(sorted([a, b]))
            edges[tmp] = 1

            if not a in deleted:
                print '// inclusion of %s discludes %s' % (a,b)
                deleted[b] = 1
    
print '// total nodes: %d' % len(allNodes)
print '// total allowed: %d' % (len(allNodes) - len(deleted))
print '// total deleted: %d' % len(deleted)
print 'graph stuff {'
for e in edges.keys():
    print '    ', e

for n in allNodes:
    if n in deleted:
        print "    \"%s\" [style=filled, fillcolor=red]" % n
    else:
        print "    \"%s\" [style=filled, fillcolor=green]" % n
print '}'
~~~

