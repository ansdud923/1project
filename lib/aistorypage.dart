import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AIStoryPage extends StatefulWidget {
  const AIStoryPage({super.key});

  @override
  State<AIStoryPage> createState() => _AIStoryPageState();
}

class _AIStoryPageState extends State<AIStoryPage> {
  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _lengthController  = TextEditingController();
  String _story = '';

  @override
  void dispose() {
    _keywordController.dispose();
    _lengthController.dispose();
    super.dispose();
  }

  void _generateStory() {
    // TODO: 여기에 파이썬 API 호출 로직 추가
    setState(() {
      _story = '“${_keywordController.text}”을(를) 주제로, 약 ${_lengthController.text}자 분량의 동화가 여기에 표시됩니다.';
    });
  }

  void _readStory() {
    // TODO: TTS 호출 로직 추가
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 키워드 입력란
          TextField(
            controller: _keywordController,
            decoration: const InputDecoration(
              labelText: '키워드 입력',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          // 글 길이 입력란
          TextField(
            controller: _lengthController,
            decoration: const InputDecoration(
              labelText: '글 길이(자) 입력',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),

          // 동화 생성 버튼
          ElevatedButton(
            onPressed: _generateStory,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              backgroundColor: const Color(0xFFECA666),
            ),
            child: const Text('동화 생성'),
          ),
          const SizedBox(height: 16),

          // 생성된 동화 텍스트
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                _story,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
          ),

          // 읽어주기 버튼 (TTS)
          if (_story.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: _readStory,
                icon: const Icon(Icons.volume_up),
                tooltip: '동화 읽어주기',
              ),
            ),
        ],
      ),
    );
  }
}