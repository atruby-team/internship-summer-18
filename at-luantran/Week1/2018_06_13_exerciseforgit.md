# W1 - D1 - LuanTran - Exercise for git


## Bài tập 1
- So sánh giữa git `commit -m "Message"` và `git commit -am "Message"`
##### Giống nhau:
- Dùng để tạo commit mới lưu lại lịch sử chỉnh sửa của mã nguồn.
#####  Khác nhau: 
- `commit -m "Message"` phải sử dụng `git add` để stage các tập tin bị thay đổi rồi mới tạo commit.
-  `git commit -am "Message"` có thể  tự động stage các file đã được commit và modified vào vùng staged nên có thể tạo commit mới mà không cần dùng `git add`.
## Bài tập 2
- Repository là gì
 
`Repository` hay còn gọi là Repo là nơi chứa tất cả mã nguồn cho một dự án được quản lý bởi Git, có thể hiểu một cách khác là `Repository` chính khai báo thư mục chứa dự án của bạn trên local hoặc remote. 

Có lại loại repository đó là local repository và remote repository.
## Bài tập 3
- Các bước để push code lên repository server

Bước 1: Đề xuất các thay đổi `git add <tên-tập tin>` , `git add *`

Bước 2: Tạo commit `git commit -m "Message"` 

Bước 3: Push code lên repository server `git push remote_name branch_name`
## Bài tập 4
- So sánh giữa `git merge` và `git rebase`

##### Giống nhau:
Tích hợp những thay đổi trong một nhánh vào một nhánh khác.
##### Khác nhau:
Việc dùng `git rebase` sẽ tạo ra một đường thẳng trong lịch sử commit giúp cho lịch sử commit gọn gàng hơn và sạch sẽ hơn.

Khi dùng `git merge` sẽ có thêm 1 commit merge mỗi lần bạn cần tích hợp những thay đổi từ các nhánh khác vào nó.

## Bài tập 5
- Pull Request là gì? Làm cách nào để tạo PR

`Pull request` là một thông báo cho người khác về những thay đổi bạn đã đẩy tới  GitHub repository. Khi push request được gửi, các bên quan tâm có thể xem xét tập hợp các thay đổi, thảo luận các sửa đổi để có thể chấp nhận việc tích hợp thay đổi.
##### Cách tạo PR:
- Trên GitHub, nhấp đến trang chính repository muốn tạo pull request.
- Ở bên phải menu Branch, nhấp vào `New pull request`.
![PR](https://help.github.com/assets/images/help/pull_requests/pull-request-start-review-button.png)

- Sử dụng menu thả xuống nhánh cơ sở để chọn chi nhánh bạn muốn hợp nhất các thay đổi của mình, sau đó sử dụng menu thả xuống so sánh nhánh để chọn nhánh chủ đề bạn đã thực hiện thay đổi.
![Branch](https://help.github.com/assets/images/help/pull_requests/choose-base-and-compare-branches.png)

- Nhập tiêu đề và mô tả cho PR.
![Title](https://help.github.com/assets/images/help/pull_requests/pullrequest-description.png)

- Nhấn `Create pull request`
![Create](https://help.github.com/assets/images/help/pull_requests/pullrequest-send.png)

## Bài tập 6
- Tìm hiểu cách viết markdown và đưa ra một số cú pháp trong markdown

**Markdown** là ngôn ngữ đánh dấu văn bản được tạo ra bởi John Gruber. Markdown sử dụng cú pháp khá đơn giản và dễ hiểu để đánh dấu văn bản và văn bản được viết bằng Markdown sẽ có thể được chuyển đổi sang HTML. Ngược lại các văn bản được viết bằng HTML cũng có thể được chuyển đổi sang Markdown.

##### Một số cú pháp trong Markdown:
- Tiêu đề:

Các lớp tiêu đề h1,h2,h3 cho đến h6 có thể viết được bằng cách thêm số lượng ký tự # tương ứng vào đầu dòng. Một ký tự # tương đương với h1, 2 ký tự # tương đương với h2 ... Tuy vậy để viết một bài viết dễ đọc thì hiếm khi cần dùng đến quá 3 ký tự này.
``` html
# Header h1
## Header h2
### Header h3
```

- Bôi đậm và in nghiêng

Kẹp một từ ở đầu và cuối bằng 1 ký tự * để in nghiêng, 2 ký tự ** để bôi đậm, và 3 ký tự *** để vừa in nghiêng vừa bôi đậm.
Nếu muốn bạn có thể dùng gạch dưới _ thay cho dấu sao *.
``` html
**Bold** and *italic* and ***both***.
__Bold__ and _talic_ and ___both___
```

- Link

Viết link trong markdown bằng cách cho alt text vào trong ngoặc vuông[] và link thật vào trong ngoặc đơn (). Ví dụ ở đây giống hệt ví dụ đầu tiên về John_Gruber ở đoạn trên.
``` html
[John_Gruber](https://en.wikipedia.org/wiki/John_Gruber)
```

- Hình ảnh
Chèn hình ảnh trong markdown chỉ khác với chèn link đôi chút. Bạn thêm ký tự ! vào đầu tiên, sau đó ghi alt text và link ảnh vào trong ngoặc vuông [] và ngoặc đơn ().
``` html
![Atom](https://atom.io/assets/packages-d16d6cc46fd0cf01842409577e782b74.gif)
```

- Định dạng danh sách

Để định đạng một đoạn văn bản thành các gạch đầu dòng trong markdown, bạn dùng ký tự * và một dấu cách ở mỗi ý và dùng thêm 2 dấu cách ở đằng trước nếu muốn lùi vào một level.
``` html
* Ruby
* PHP
  * Laravel
  * Symfony
  * Phalcon
* Python
  * Flask
     * Jinja2
     * WSGI1.0 
  * Django 
```
- Bảng

Vẽ bảng trong Markdown sẽ hơi khó nếu bạn chưa quen. Các cột được tách nhau bằng dấu ngăn thẳng đứng | và header được tách với content bằng dấu gạch ngang `-`.
``` html
| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
```

- Link tài liệu tham khảo

Markdown được thiết kế để dễ nhìn ngay ở định dạng tự nhiên. Vì vậy bạn có thể đánh dấu mỗi link thành từng số và viết tất cả link thực tương ứng với các số ở cuối cùng.
``` html
Let's check out [Wikipedia][1] and [Google][2].
...
...
[1]: https://en.wikipedia.org "Wikipedia"
[2]: https://www.google.com "Google"
```
- Chú thích
 
Chú thích hay footnote sẽ dùng ký tự ^ bên trong ngoặc vuông [] để đánh dấu và viết lại giải thích ở cuối, cách viết tương tự như link tài liệu tham khảo bên trên.
``` html
ohn Gruber[^1].
...
...
[^1]: writer, blog publisher, UI designer, the inventor of the Markdown publishing format. 
```

## Bài tập 7
- Viết daily report bằng markdown
##### Một số công việc đã thực hiện trong ngày:
- Tìm hiểu git và github.
- Tạo một `repository`, push code và tạo `pull request`.
- Tìm hiểu `markdown`.


