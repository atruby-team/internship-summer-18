# W1 - D1 - Dũng Nguyễn Q. - Exercise for git

## Bài tập 1 - Sự khác nhau giữa **commit -m "Message"** và **commit -am "Message"**

### Commit -m "Message"

  Tạo ra một commit mới và lưu trữ vào repository các thay đổi sau khi `add` kèm 1 thông điệp "Message".

### Commit -am "Message"

  Thực hiện việc add và commit, tạo ra một commit mới và lưu trữ các file có trạng thái modified (Đã được commit ít nhất 1 lần trước đó) kèm 1 thông điệp "Message" mà không cần
  thực thi lệnh `git add`. Các file tạo mới sẽ không có hiệu lực và sẽ không được lưu vào repo.

## Bài tập 2 - Repository là gì?

Repository là kho lưu trữ source code của dự án.

Có 2 loại repository là **local repository** và **remote repository**.

- **Local repository** là nơi lưu trữ mã nguồn trên máy tính của người lập trình, có thể đồng bộ hóa với remote repository qua các lệnh git.

- **Remote repository** là nơi lưu trữ mã nguồn trên server như Github.

![Repository](https://freetuts.net/upload/tut_post/images/2017/10/09/1071/basic-remote-workflow.png)

## Bài tập 3 - Các bước để push code lên repository server

- Bước 1: Yêu cầu lưu các thay đổi mà người lập trình muốn lưu qua lệnh `git add`.

Ví dụ: Yêu cầu lưu tất cả các file thay đổi.

``` python
  git add .
```

- Bước 2: Lưu thay đổi vào local repository qua lệnh `git commit`.

Ví dụ: Lưu vào local repository kèm thông điệp

``` python
  git commit -m "Save changes"
```

- Bước 3: Đẩy code lên remote repository qua lệnh `git push tên-remote tên-nhánh`.

Ví dụ: Đẩy code lên nhánh master của repo có tên là origin

``` python
  git push origin master
```

## Bài tập 4 - So sánh giữa git merge và git rebase

- Giống nhau: Mục đích để gộp nhánh này với nhánh khác

- Khác nhau:
  | Merge                                   | Rebase                                |
  | --------------------------------------- | ------------------------------------- |
  | - Tạo commit mới trên nhánh được merge. | - Không tạo commit mới.               |
  | - Lịch sự commit sắp xếp tuần tự | - Lịch sử commit sắp xếp nối tiếp luôn luôn mới nhất |

## Bài tập 5 - Pull Request là gì? Làm thế nào để tạo Pull Request

**Pull Request** là một yêu cầu gộp nhánh. Thông thường người lập trình sẽ tạo
ra một nhánh mới và làm việc. Sau khi hoàn thành và push lên remote repository,
Người lập trình tạo Pull Request để yêu cầu gộp nhánh của họ vào nhánh `master` của dự án.

- Các buộc tạo Pull Request
  Bước 1: Trên Github, điều hướng đến trang chính của repository.

  Bước 2: Trong menu `Branch`, chọn nhánh cần gộp.

  Bước 3: Nhấn **New pull request**.

  Bước 4: Trong dropmenu base branch, bạn chọn nhánh mà bạn muốn merge các thay đổi vào,
  trong compare branch, bạn chọn nhánh muốn merge vào base branch.

  Bước 5: Viết tiêu đề và mô tả yêu cầu.

  Bước 6: Nhấn **Create pull request**.

## Bài tập 6 - Tìm hiểu cách viết markdown và đưa ra một số cú pháp trong markdown

- Headers

``` html

# Tiêu đề <h1>
## Tiêu đề <h2>
### Tiêu đề <h3>

```

- Emphasis

``` html

*In nghiêng*
_In nghiêng_

**In đậm**
__In đậm__

```

- Lists

``` html

  Unordered List
  * Item 1
  * Item 2
    * Item 2a
    * Item 2b

  Ordered List
  1. Item 1
  1. Item 2
    1. Item 2a
    1. Item 2b
```

- Images

``` html

![Goole](/images/google.png)
Format: ![Alt Text](url)

```

- Links

``` html

http://github.com - automatic!
[GitHub](http://github.com)

```

- Blockquotes

``` html

As Kanye West said:

> We're living the future so
> the present is our past.

```

- Inline code

``` html

I think you should use an
`<addr>` element here instead.

```

## Bài tập 7 - Daily Report

- Đọc tài liệu Ruby
- Tìm hiểu Git và Github Flow
- Tìm hiểu Repository và các lệnh của Git như add, commit, merge, rebase,...
- Biết cách tạo Pull Request và Fix Conflicts
- Tìm hiểu markdown và 1 số cú pháp cơ bản
