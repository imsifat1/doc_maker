import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../pdf_preview_page.dart';

class CreateDoc extends StatefulWidget {
  const CreateDoc({Key? key}) : super(key: key);

  @override
  State<CreateDoc> createState() => _CreateDocState();
}

class _CreateDocState extends State<CreateDoc> {

  bool _isEditing = false;
  bool _isUnderline = false;

  final QuillController _controller = QuillController.basic();
  final docTitle = TextEditingController();
  final docBody = TextEditingController();


  @override
  void initState() {
    super.initState();
    docTitle.text = 'Untitled Doc';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isEditing? null : AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey.shade700, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListTile(
            title: SizedBox(
              height: 40,
              child: TextFormField(
                controller: docTitle,
                expands: true,
                maxLines: null,
                minLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            // subtitle: const Text("All Changes Saved", style: TextStyle(fontSize: 10),),
          ),
        ),
        actions: [

          IconButton(onPressed: (){}, icon: const Icon(Icons.person_add_alt),),

          IconButton(onPressed: (){}, icon: const Icon(Icons.comment_outlined),),

          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert),),
        ],
      ),
      floatingActionButtonLocation: _isEditing == false ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _isEditing == false ? FloatingActionButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfPreviewPage(text: _controller.plainTextEditingValue.text,),),);}, child: Icon(Icons.picture_as_pdf_outlined),) : Visibility(
        visible: _isEditing,
        child: Container(
          color: Colors.blue.shade100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              IconButton(onPressed: (){}, icon: const Icon(Icons.format_bold),),

              IconButton(onPressed: (){}, icon: const Icon(Icons.format_italic),),

              IconButton(onPressed: (){}, icon: const Icon(Icons.format_underline),),

              IconButton(onPressed: (){}, icon: const Icon(Icons.text_format),),

              Container(height: 30, width: 1, color: Colors.grey,),

              IconButton(onPressed: (){}, icon: const Icon(Icons.format_align_left_outlined),),

              Container(height: 30, width: 1, color: Colors.grey,),

              IconButton(onPressed: (){}, icon: const Icon(Icons.format_list_bulleted),),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              QuillToolbar.basic(controller: _controller),
              Expanded(
                child: Container(
                  child: QuillEditor.basic(
                    controller: _controller,
                    readOnly: false, // true for view only mode
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
