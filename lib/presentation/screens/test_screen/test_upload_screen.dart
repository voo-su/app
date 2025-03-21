import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/presentation/cubit/upload_cubit.dart';

class TestUploadScreen extends StatefulWidget {
  const TestUploadScreen({super.key});

  @override
  State<TestUploadScreen> createState() => _TestUploadScreenState();
}

class _TestUploadScreenState extends State<TestUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {
          if (state is FileUploadSuccess) {
            print('<< VLog - TestUploadScreen - OK >>');
          } else if (state is FileUploadFailure) {
            print('<< VLog - TestUploadScreen - err ${state.error}} >>');
          }
        },

        builder: (context, state) {
          final cubit = context.read<UploadCubit>();

          return Column(
            children: [
              ElevatedButton(
                onPressed: () => _showFilePicker(context),
                child: Text("Выбрать"),
              ),

              if (state is FileUploadInProgress)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed:
                      cubit.selectedPath != null
                          ? () => cubit.uploadFile()
                          : null,
                  child: Text("Загрузить"),
                ),
            ],
          );
        },
      ),
    );
  }

  void _showFilePicker(BuildContext context) {
    final cubit = context.read<UploadCubit>();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final files = cubit.getImageFiles();
        return ListView(
          children:
              files.map((file) {
                return ListTile(
                  leading: Image.file(
                    file,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(file.path.split('/').last),
                  onTap: () {
                    context.read<UploadCubit>().selectFile(file.path);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
        );
      },
    );
  }
}
