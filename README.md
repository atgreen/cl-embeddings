# cl-embeddings
> A Common Lisp embeddings library

Usage
------

`cl-embeddings` is available via [ocicl](https://github.com/ocicl/ocicl).  Install it like so:
```
$ ocicl install embeddings
```

`cl-embeddings` supports both [ollama](https://ollama.com/) and [OpenAI](https://openai.com/blog/openai-api) APIs.

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

* [cl-text-splitter](https://github.com/atgreen/cl-text-splitter): a text splitting library
* [cl-completions](https://github.com/atgreen/cl-completions): an LLM completions library
* [cl-chroma](https://github.com/atgreen/cl-chroma): for a Lisp interface to the [Chroma](https://www.trychroma.com/) vector database.
* [cl-chat](https://github.com/atgreen/cl-chat): a wrapper around `completions` to maintain chat history,

Author and License
-------------------

``cl-embeddings`` was written by [Anthony
Green](https://github.com/atgreen) and is distributed under the terms
of the MIT license.
