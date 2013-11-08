# TTTQuadrantControl
## A 4-way button disguised as a table cell, as seen in Tweetie 2

![Screenshot of TTTQuadrantControl](http://mattt.github.com/TTTQuadrantControl/screenshot.png "TTTQuadrantControl Screenshot")

## Example Usage

``` objective-c
TTTQuadrantControl *quadrantControl = [[[TTTQuadrantControl alloc] initWithFrame:CGRectMake(10, 20, 300, 90)] autorelease];
quadrantControl.delegate = self;
[quadrantControl setNumber:[NSNumber numberWithInt:127]
                   caption:@"following"
                    action:@selector(didSelectFollowingQuadrant)
               forLocation:TopLeftLocation];

[quadrantControl setNumber:[NSNumber numberWithInt:1728]
                   caption:@"tweets"
                    action:@selector(didSelectTweetsQuadrant)
               forLocation:TopRightLocation];

[quadrantControl setNumber:[NSNumber numberWithInt:352]
                   caption:@"followers"
                    action:@selector(didSelectFollowersQuadrant)
               forLocation:BottomLeftLocation];

[quadrantControl setNumber:[NSNumber numberWithInt:61]
                   caption:@"favorites"
                    action:@selector(didSelectFavoritesQuadrant)
               forLocation:BottomRightLocation];
```

## License

TTTQuadrantControl is licensed under the MIT License:

  Copyright (c) 2011 Mattt Thompson (http://mattt.me/)

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

## Credit

Inspired entirely by the amazing [Tweetie 2 for iPhone](http://www.atebits.com/tweetie-iphone/), by [atebits](http://www.atebits.com/)