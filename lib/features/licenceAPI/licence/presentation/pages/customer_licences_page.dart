import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence/core/extensions/string_extension.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/bloc/licence_cubit.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/bloc/licence_state.dart';

class CustomerLicencesPage extends StatefulWidget {
  const CustomerLicencesPage({super.key});

  @override
  State<CustomerLicencesPage> createState() => _CustomerLicencesPageState();
}

class _CustomerLicencesPageState extends State<CustomerLicencesPage> {
  @override
  void initState() {
    super.initState();
      Future.microtask(() =>
      context.read<LicenceCubit>().getLicensesOfCustomer());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<LicenceCubit, LicenceState>(
              builder: (context, state) {
                
                print(state.toString()+"durum");
                if (state is LicenceLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LicenceLoadedState) {
                  if (state.licences.isEmpty) {
                    return const Center(
                      child: Text(
                        "Müşteriye ait lisans bulunmamaktadır.",
                      ),
                    );
                  }
                  return ListView.builder(
                    // ListView'ı Card'ları göstermek için kullanıyoruz
                    itemCount: state.licences.length,
                    itemBuilder: (context, index) {
                      final license = state.licences[index];

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                license.licenseName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(),

                              _buildInfoRow(
                                icon: Icons.people,
                                label: "Kullanıcı Sayısı:",
                                value: "${license.amountOfUser} Kişi",
                              ),

                              _buildInfoRow(
                                icon: Icons.attach_money,
                                label: "Fiyat:",
                                value:
                                    '${license.licensePrice.toStringAsFixed(2)} ₺',
                              ),

                              _buildInfoRow(
                                icon: Icons.calendar_today,
                                label: "Süre:",
                                value:
                                    '${license.startDate} - ${license.endDate}',
                              ),

                              _buildInfoRow(
                                icon: license.isAktive
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                label: "Durum:",
                                value: license.isAktive
                                    ? "Aktif"
                                    : "Süresi Dolmuş",
                                color: license.isAktive
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                else if(state is LicenceErrorState){
                  return Text(state.errorMessage);
                }

                return SizedBox.shrink();
              },
            ),
            _addButtonWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color color = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _addButtonWidget extends StatelessWidget {
  const _addButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LicenceCubit, LicenceState>(
      builder: (context, state) {
        return FilledButton(
          onPressed: () {
            //route ile ekleme sayfasına gitmeliyiz
          },
          child: Text("data"),
        );
      },
    );
  }
}
