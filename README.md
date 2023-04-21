# Social Media App

### Base API
JSON Placeholder API ```https://jsonplaceholder.typicode.com/```

## Posts Feature Specs

- List posts displaying name of the author and avatar, post title and post body
- Online mode
- Offline mode

### Use Cases

- Load posts from remote
- Load posts from cache


### Model Specs
#### Post

| Property          | Type                |
|-------------------|---------------------|
| `userId`          | `Integer`           |
| `id`              | `Integer`           |
| `title`           | `String`            |
| `body`            | `String`            |

#### Post author

| Property          | Type                |
|-------------------|---------------------|
| `id`              | `Integer`           |
| `name`            | `String`            |
| `avatar`          | `URL`               |

### Payload Contract


---

## App Architecture
