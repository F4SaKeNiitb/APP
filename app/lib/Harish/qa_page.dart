import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class ChatMessage {
  final String content;
  final MessageType type;

  ChatMessage({required this.content, required this.type});
}

enum MessageType { user, llm }

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [
    ChatMessage(content: "Hi there! How can I help you today?", type: MessageType.llm),
    ChatMessage(content: "Can you show me the formula for the area of a circle?", type: MessageType.user),
    ChatMessage(content: r"The area of a circle is given by \( A = \pi r^2 \).", type: MessageType.llm), // Corrected LaTeX
  ];

  final TextEditingController _textController = TextEditingController();

  void sendMessage() {
    if (_textController.text.isEmpty) return;
    setState(() {
      messages.add(ChatMessage(content: _textController.text, type: MessageType.user));
      // Simulating LLM response
      messages.add(ChatMessage(content: r"Here’s your LaTeX: \[ E = mc^2 \]", type: MessageType.llm));
      _textController.clear();
    });
  }

  Widget buildMessageBubble(ChatMessage message) {
    bool isUser = message.type == MessageType.user;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) ...[
            const CircleAvatar(child: Text('L')), // LLM Avatar
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isUser ? Colors.blue[200] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: isUser
                      ? Text(message.content)
                      : TeXView(
                          child: TeXViewDocument(
                            message.content,
                            style: const TeXViewStyle(
                              contentColor: Colors.black,
                              backgroundColor: Colors.transparent,
                              padding: TeXViewPadding.all(10),
                            ),
                          ),
                          renderingEngine: const TeXViewRenderingEngine.katex(),
                        ),
                ),
              ],
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 10),
            const CircleAvatar(child: Text('U')), // User Avatar
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with LaTeX'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildMessageBubble(messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: ChatScreen(),
));
