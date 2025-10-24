import 'package:flutter/material.dart'; // IMPORTANTE!

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String> onChanged;

  const GenderSelector({
    Key? key,
    required this.selectedGender,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Gênero:'),
        SizedBox(width: 20),
        DropdownButton<String>(
          value: selectedGender,
          items: ['Masculino', 'Feminino']
              .map((g) => DropdownMenuItem<String>(
                    value: g,
                    child: Text(g),
                  ))
              .toList(),
          onChanged: (String? value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ],
    );
  }
}