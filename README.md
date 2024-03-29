# cl-embeddings
> A Common Lisp embeddings library

Usage
------

`cl-embeddings` is available via [ocicl](https://github.com/ocicl/ocicl).  Install it like so:
```
$ ocicl install embeddings
```

`cl-embeddings` supports both ollama and OpenAI APIs.

Use ollama models like so:
```
(let ((embedder (make-instance 'ollama-embeddings :model "mistral:latest")))
  (get-embeddings embedder "This is some text."))
```

And use OpenAI models like so:
```
(let ((embedder (make-instance 'openai-embeddings :api-key OPENAI-API-KEY)))
  (get-embeddings embedder "This is some text."))
```

Related Projects
-----------------

See also [cl-completions](https://github.com/atgreen/cl-completions)
for a similarly styled LLM completions library, and
[cl-chroma](https://github.com/atgreen/cl-chroma) for a Lisp interface
to the [Chroma](https://www.trychroma.com/) vector database.

Author and License
-------------------

``cl-embeddings`` was written by [Anthony
Green](https://github.com/atgreen) and is distributed under the terms
of the MIT license.
