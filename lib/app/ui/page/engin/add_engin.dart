import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:transport_app/app/ui/shared/utils/pop_up_model.dart';

class AddEngin extends StatefulWidget {
  const AddEngin({super.key});

  @override
  State<AddEngin> createState() => _AddEnginState();
}

class _AddEnginState extends State<AddEngin> {
  @override
  Widget build(BuildContext context) {
    return const PoppupModel(
      text: 'Ajout Engin',
    );
  }
}
