# docker-jekyll
jeklly build with docker

This image can pull git file in /git/, and bulld to /www/ .

```
0 */6 * * * sudo docker run -it --rm -v /data/blog/www/:/www/ -v /data/blog/blog/:/git/ microwww/jekyll
```
