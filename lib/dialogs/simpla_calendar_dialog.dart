import 'package:flutter/material.dart';
import 'package:helpers/functional/time_handler.dart';

import '../buttons/simpla_text_button.dart';
import '../estilos/cores.dart';

class SimplaCalendarDialog extends StatefulWidget {
  final String header;
  const SimplaCalendarDialog({Key? key, required this.header}) : super(key: key);

  @override
  State<SimplaCalendarDialog> createState() => _SimplaCalendarDialogState();
}

class _SimplaCalendarDialogState extends State<SimplaCalendarDialog> {
  DateTime picked = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              color: azul,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(widget.header,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal)),
                    const SizedBox(height: 5),
                    Text(TimeHandler(picked).toDate(),
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600)),
                  ],
                ),
              )),
          CalendarDatePicker(
              initialDate: picked,
              firstDate: DateTime(2022),
              lastDate: DateTime(2025),
              onDateChanged: (date) {
                setState(() {
                  picked = date;
                });
              }),
          SimplaTextButton(
            content: "Confirmar",
            onPressed: () {
              Navigator.pop(context, picked);
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
