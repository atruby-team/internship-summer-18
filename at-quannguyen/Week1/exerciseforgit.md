# Bài tập exercise for git 

#### 1. So sánh giữa git commit -m "Message" và git commit -am "Message"
##### Điểm giống nhau :
- Đưa dư liệu ở vùng staged vào unmodified sẵn sàng đẩy lên repo remote .
##### Điểm khác nhau :
Commit -m :
- Thực hiện `add . ` trước khi Tạo ra một commit và một message mới .

Commit -am :
- Nếu file ở trang thái `modifiled` , khi chuyển trạng thái qua unmodifiled thì có thể bỏ qua bước `add .` bằng `commit -am` .
#### 2. Repository là gì 
Repository, chính là nơi chứa tất cả mã nguồn cho một dự án được quản lý bởi Git. Bạn cũng có thể hiểu một cách khác là Repository chính khai báo thư mục chứa dự án của bạn trên local hoặc remote. Môi repo sẽ có hai cấu trúc dữ liệu chính đó là Object store và Index được lưu trữ ẩn trong thư mục .git
Có lại loại repository đó là local repository và remote repository.
- **Local repository**: Là repo được cài đặt trên máy tính của lập trình viên, repo này sẽ đồng bộ hóa với remote repo bằng các 
- **Remote repository**: Là repo được cài đặt trên server chuyên dụng, điển hình hiện nay là Github.
#### 3. Các bước để push code lên repository server
Khi đã có môi trường git và kết nối repo remote ,để đẩy code lên theo bước sau :
- `git add .` (đưa tất cả tài nguyên mới hoặc thay đổi từ vùng (untracked, modified) vào vùng theo dõi bởi git (staged) ) .
- `git commit -m "Message"` (ghi lại móc lịch sử commit và đưa tài nguyên vào vùng (Unmodified) để sẵn sàng đẩy lên repo remote ) .
- `git push <name-remote-add> <name-branch>` (Tiến hành xác định kho chứa remote và nhánh cần đẩy lên repo remote) .
#### 4. So sánh giữa git merge và git rebase
##### Điểm giống nhau :
- Cả hai lệnh `rebase` và `merge` đều dùng để giải quyết cùng một vấn đề , tích hợp những thay đổi từ một nhánh vào một nhánh khác.
##### Điểm khác nhau :
Merge :
- Với cách làm này, một **commit merge** mới sẽ xuất hiện ở lịch sử commit của nhánh được merge, giống như một mối nối để ghép lại lịch sử của cả 2 nhánh.

Rebase :
- Thao tác này sẽ đưa toàn bộ những commit mới tạo ở nhánh được merge nối tiếp vào "ngọn" của nhánh master, nhưng thay vì sử dụng một commit merge, nó sẽ viết lại lịch sử của project bằng cách tạo ra những commit mới ứng với mỗi commit ban đầu của nhánh được merge.
#### 5. Pull Request là gì? Làm cách nào để tạo PR
##### - Pull Request là gì ?
- PR là một yêu cầu merge 1 branch vào nhánh master , được merge khi code hoặc tài nguyên đã được review xong và được cho merge của người quản lý .

##### - Làm cách nào để tạo PR ?
- Tạo push đẩy một nhánh mới lên repo remote .
-Khi lên github sẽ hiện một nút Pull Request , khi nhấn vào sẽ so sánh nhánh vừa được đẩy lên với nhánh master có gì khác không .
- Nếu có khác thì nút New Pull Request sẽ không bị disable nữa , khi chọn vào sẽ qua trang hiện thị thông tin của pull request đó , nhấn create pull request để tạo PR vậy đã tạo thành công 1 pull request .
#### 6. Tìm hiểu cách viết markdown và đưa ra một số cú pháp trong markdown
#####  Một số cú pháp trong markdown :
- ` # ` Tiêu đề  bài viết , 1 # tương ứng với `h1` trong **html**, 2 # tương ứng với h2 , cứ thế tăng dần để khớp với các `h` còn lại .
- ` * <text> * ` Dùng để in nghiêng văn bản .
- ` ** <text> ** ` Dùng để in đậm văn bản .
- ` *** <text> *** ` Dùng để vừa in đậm vừa in nghiêng .
- ` `` ` Dùng để bao khung cho 1 dòng mã lệnh .
- ``` <code> ``` Dùng để bao khung cho nhiều dòng mã lệnh .
- ` - , * ` Dùng để tạo list danh sách dạng (.) .
- ` <1..5>. ` Dùng để tạo list danh sách dạng só .
- `[title](link)` Dùng để tạo một liên kết .
- `![alt](link)` Dùng để chèn hình .
- ` *** ` Dùng để  horizonal rules . 
- `>` Dùng để blockquotes .
- `\*text*` Dùng để  sử dụng những kí kiệu trùng với cú pháp của markdown .
#### 7. Viết daily report bằng markdown
##### Ngày ni em tìm hiểu :
- Ôn lại ruby .
- Ôn lại git và giải quyết được các thắc mắt phát sinh .
- Tìm hiểu và thực hành các cú pháp của markdown . 
- Làm xong bài tập được training giao .
