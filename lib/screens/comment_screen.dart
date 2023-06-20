import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class Comment {
  final String userName;
  final String avatarImagePath;
  final String commentText;

  Comment(
      {required this.userName,
      required this.avatarImagePath,
      required this.commentText});
}

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<Comment> comments = [];
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Thêm một số comment mẫu
    comments = [
      Comment(
        userName: 'John Doe',
        avatarImagePath: 'assets/images/logo_facebook.png',
        commentText: 'This is a great post!',
      ),
      Comment(
        userName: 'Jane Smith',
        avatarImagePath: 'assets/images/logo_google.png',
        commentText: 'I totally agree with you.',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Thực hiện hành động khi nút "quay lại" được nhấn
            Navigator.of(context).pop(); // Quay lại trang trước đó
          },
        ),
        centerTitle: true,
        title: Text(
          'Chi tiết công thức',
          style: Styles.headLineStyle3,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (BuildContext context, int index) {
                Comment comment = comments[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(comment.avatarImagePath),
                  ),
                  title: Text(
                    comment.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(comment.commentText),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String commentText = commentController.text;
                    setState(() {
                      Comment newComment = Comment(
                        userName: 'Your Name',
                        avatarImagePath: 'assets/images/avt.jpg',
                        commentText: commentText,
                      );
                      comments.add(newComment);
                      commentController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
