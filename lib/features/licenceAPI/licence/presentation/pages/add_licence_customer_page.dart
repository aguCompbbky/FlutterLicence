import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class AddLicenceCustomerPage extends StatefulWidget {
  const AddLicenceCustomerPage({super.key});

  @override
  State<AddLicenceCustomerPage> createState() => _AddLicenceCustomerPageState();
}

class _AddLicenceCustomerPageState extends State<AddLicenceCustomerPage> {
  final _startCtrl = TextEditingController();
  final _endCtrl = TextEditingController();

  DateTime? _start;
  DateTime? _end;

  @override
  void dispose() {
    _startCtrl.dispose();
    _endCtrl.dispose();
    super.dispose();
  }

  // Simple yyyy-MM-dd formatter to avoid extra deps
  String _fmt(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _pickDate({required bool isStart}) async {
    // Single-date picker config
    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.single,
      firstDayOfWeek: 1,
      selectedDayHighlightColor: Colors.blueAccent,
      closeDialogOnOkTapped: true,
    );

    // Preselect currently chosen date if exists
    final initial = isStart ? _start : _end;
    final values = await showCalendarDatePicker2Dialog(
      context: context,
      config: config,
      value: [initial ?? DateTime.now()],
      dialogSize: const Size(320, 380),
      borderRadius: BorderRadius.circular(12),
      dialogBackgroundColor: Colors.white,
    );

    if (values == null || values.isEmpty || values.first == null) return;

    final picked = DateUtils.dateOnly(values.first!);

    if (isStart) {
      _start = picked;
      _startCtrl.text = _fmt(picked);

      // If end is set and now invalid, clear it
      if (_end != null && _end!.isBefore(_start!)) {
        _end = null;
        _endCtrl.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('End date cleared (must be >= Start date).')),
        );
      }
    } else {
      // If no start yet, set start = picked as a convenience
      if (_start == null) _start = picked;
      if (picked.isBefore(_start!)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('End date must be on/after Start date.')),
        );
        return;
      }
      _end = picked;
      _endCtrl.text = _fmt(picked);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick Start & End Dates')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // START DATE FIELD
              TextFormField(
                controller: _startCtrl,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  hintText: 'Select start date',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _pickDate(isStart: true),
                  ),
                  border: const OutlineInputBorder(),
                ),
                onTap: () => _pickDate(isStart: true),
              ),
              const SizedBox(height: 16),
              // END DATE FIELD
              TextFormField(
                controller: _endCtrl,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'End Date',
                  hintText: 'Select end date',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _pickDate(isStart: false),
                  ),
                  border: const OutlineInputBorder(),
                ),
                onTap: () => _pickDate(isStart: false),
              ),
              const SizedBox(height: 24),
              // Simple preview row
              if (_start != null || _end != null)
                Text(
                  'Selected: ${_start != null ? _fmt(_start!) : '—'}  →  ${_end != null ? _fmt(_end!) : '—'}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
