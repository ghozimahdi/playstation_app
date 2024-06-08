# Conventional Commits Template

Conventional Commits adalah konvensi untuk menuliskan pesan commit yang terstruktur dan konsisten.
Konvensi ini membantu pengembang dalam memahami perubahan yang dilakukan, memudahkan pelacakan
sejarah perubahan, dan integrasi dengan alat otomasi.

Berikut adalah template yang bisa Anda gunakan untuk pesan commit berdasarkan konvensi Conventional
Commits:

## Jenis Commit

- **feat**: Penambahan fitur baru
- **fix**: Perbaikan bug
- **docs**: Perubahan atau penambahan dokumentasi
- **style**: Perubahan kode yang tidak mempengaruhi arti (misalnya: whitespace, formatting, missing
  semi-colons, dll)
- **refactor**: Perubahan kode yang tidak memperbaiki bug atau menambah fitur
- **perf**: Perubahan kode untuk meningkatkan performa
- **test**: Penambahan atau perbaikan tes
- **chore**: Perubahan pada build process atau alat bantu, library, dll (misalnya: perubahan
  pada `package.json`, `Makefile`, dll)

## Struktur Template

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

- **type**: Jenis perubahan yang dibuat (feat, fix, etc.)
- **scope**: Lingkup dari perubahan (opsional)
- **subject**: Deskripsi singkat tentang perubahan
- **body**: Deskripsi mendetail tentang perubahan (opsional)
- **footer**: Informasi tambahan seperti referensi tiket/isu (opsional)

## Contoh Commit Menggunakan Template Conventional Commits

### 1. Penambahan Fitur Baru

```
feat(auth): add JWT authentication

Added JWT authentication for user login and registration.
This improves the security and scalability of our application.

Closes #123
```

### 2. Perbaikan Bug

```
fix(navbar): fix unresponsive menu on mobile

The navigation menu was not opening on mobile devices.
This fix corrects the issue by adding a click event handler.

Closes #456
```

### 3. Perubahan Dokumentasi

```
docs(readme): update setup instructions

Updated the setup instructions in the README file to include
steps for setting up the database and running migrations.
```

### 4. Perubahan Gaya (Style)

```
style: format code with prettier

Formatted the entire codebase using Prettier to ensure consistent
code style and readability.
```

### 5. Refactoring Kode

```
refactor(user-profile): simplify profile component

Refactored the user profile component to use hooks instead
of class-based components, improving readability and maintainability.
```

### 6. Peningkatan Performa

```
perf(database): optimize query for user data

Optimized the SQL query used to fetch user data, reducing the
average response time from 200ms to 50ms.
```

### 7. Penambahan Tes

```
test(auth): add unit tests for login service

Added unit tests for the login service to ensure correct
handling of authentication and token generation.
```

### 8. Perubahan Build Process

```
chore(deps): update dependencies

Updated project dependencies to their latest versions
to ensure compatibility and security.
```

## Implementasi di Git

Anda dapat menggunakan template ini dengan menuliskan pesan commit Anda sesuai dengan struktur yang
telah dijelaskan. Misalnya:

```sh
git commit -m "feat(auth): add JWT authentication

Added JWT authentication for user login and registration.
This improves the security and scalability of our application.

Closes #123"
```

Dengan menggunakan konvensi ini, pesan commit Anda akan lebih terstruktur dan mudah dipahami oleh
tim pengembang lainnya.
