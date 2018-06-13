# Exercise for git W1 - D1

### Bài 1 . So sánh giữa git commit -m "Message" và git commit -am "Message"

- commit -m "message": Xác nhận thay đổi tập tin và để lại message . phải thực hiện ADD trước khi muốn commit
- commit -am "message": giống với commit -m nhưng thực hiện luôn bước add mà không cần phải viết lệnh add. Chỉ lưu những file đã modifile mà không có hiệu lực với file tạo mới .
### Bài 2 . Repository là gì ?

- Repository(repo) là nơi lưu trữ mà nguồn và một người khác có thể sao chép lại mã nguồn đó nhằm làm việc. Repository có 2 loại là Local repository(kho chứa trên máy cá nhân) và Remote Repository(kho chứa trên một máy chủ từ xa).

### Bài 3 . Các bước để push code lên repository server ?
- Bước 1. ADD : Đề xuất thay đổi tập tin  bằng lệnh  
	**git add .**
- Bước 2. Commit : Xác nhận thay đổi tập tin và thay đổi ở Local repo . Sử dụng lệnh :xac
			
    **git commit -m "Ghi chú Commit"**
    trong đó cái trong dấu ngoặc kép là ghi chú của việc commit.
- Bước 3 . Push các thay đổi trên đến  repo remote . Sử dụng lệnh :
	
    **git push origin master** Thay đổi master bằng bất cứ nhánh nào muốn đẩy những thay đổi đến.
    
### Bài 4 . So sánh giữa git merge và git rebase ?
- Giống nhau : được sử dụng để tích hợp những thay đổi từ một nhánh vào một nhánh khác
- Khác nhau : - merge là một thao tác dễ chịu vì nó được coi là một câu lệnh không mang tính phá hủy. Những nhánh đang tồn tại không bị thay đổi.  
Với cách làm này, một commit merge mới sẽ xuất hiện ở lịch sử commit của nhánh feature, giống như một mối nối để ghép lại lịch sử của cả 2 nhánh. Bạn sẽ có một cấu trúc commit trông giống như này:

![alt](https://viblo.asia/uploads/412ef6d7-3019-4d22-8dea-43071e5770eb.png)

Rebase : Thao tác này sẽ đưa toàn bộ những commit mới tạo ở nhánh feature nối tiếp vào "ngọn" của nhánh master, nhưng thay vì sử dụng một commit merge, nó sẽ viết lại lịch sử của project bằng cách tạo ra những commit mới ứng với mỗi commit ban đầu của nhánh feature.

![alt](https://viblo.asia/uploads/cdf7a434-2ab7-4ae6-95ee-0bc41fbcf5d6.png)

Rebase mang lại lợi ích là có một lịch sử commit rõ ràng, dễ theo dõi hơn.Vì nó giúp loại bỏ những commit không cần thiết như khi sử dụng merge. Rebase còn giúp tạo lịch sử commit có dạng tuyến tính , xuyên suốt cả project. Tuy nhiên việc viết lại lịch sử của project có thể là thảm họa khó lường đối với quy trình cộng tác làm việc nhóm .

### Bài 5 . Pull Request là gì? Làm cách nào để tạo PR .
- Pull request cho phép mình thông báo cho người khác về những thay đổi mình đã push đến kho repo của Git. Khi yêu cầu PR được gửi ,các bên quan tâm có thể xem xét những thay đổi , thảo luận cách sửa đổi , và thậm chỉ push những thay đổi tiếp nếu cần .
- Cách tạo PR : truy cập repo page trên github. và chọn Pull Request trên repo header
Chọn branch muốn muốn PR 
![alt](https://f.cloud.github.com/assets/676185/316857/0d51b008-9849-11e2-909a-36e6f12436b4.png)

Nhập tiêu đề và mô tả về PR mình muốn thực hiện 

![alt](https://f.cloud.github.com/assets/676185/316873/0c0e4cc8-984a-11e2-89f5-703c31217e17.png)

Cuối cùng , click vào nút màu xanh "Send pull request" để kết thúc khởi tạo PR.

![alt](https://f.cloud.github.com/assets/676185/316876/30d6d0ca-984a-11e2-9c5e-420223c35ed9.png)

### Bài 6 . Tìm hiểu cách viết markdown và đưa ra một số cú pháp trong markdown .
- Markdown là ngôn ngữ đánh dấu văn bản được tạo ra bởi John Gruber, sử dụng cú pháp khá đơn giản và dễ hiểu, dễ nhớ.
- Cú pháp : Tiêu đề : Có thể viết các lớp tiêu đề h1, h2, h3 cho đến h6 bằng cách thêm số lượng ký tự # tương ứng vào đầu dòng. Một ký tự # tương đương với h1, 2 ký tự # tương đương với h2 ... 
- Nhấn mạnh, highlight : Bạn có thể kẹp một từ ở đầu và cuối bằng 1 ký tự * để in nghiêng, 2 ký tự ** để bôi đậm, và 3 ký tự *** để vừa in nghiêng vừa bôi đậm.

Để viết inline code, bạn dùng cú pháp ' '
Để highlight block code, bạn viết
(```)
- Link, image 

Link : sử dụng [title] (http://~)
Image : sử dụng ![alt] (http://~)

-List

List dạng gạch đầu dòng
cú pháp (*) item

List dạng số (1.)item


### Bài 7 Viết daily report bằng markdown
### Daily report W1-D1
- Tìm hiểu và học một số câu lệnh cơ bản về Git
- Cách viết markdown và một số cú pháp trong markdown
- Hoàn thành bài tập được giao 


