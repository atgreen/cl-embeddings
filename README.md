# cl-embeddings
> A Common Lisp embeddings library

Usage
------

`cl-embeddings` is available via [ocicl](https://github.com/ocicl/ocicl).  Install it like so:
```
$ ocicl install embeddings
```

OpenAI is the only supported provider today.  Use it like so:

```
(let ((embeddings (make-instance 'openai-embeddings :api-key OPENAI-API-KEY)))
  (get-embeddings embeddings "This is some text."))
```


Author and License
-------------------

``cl-embeddings`` was written by [Anthony
Green](https://github.com/atgreen) and is distributed under the terms
of the MIT license.
