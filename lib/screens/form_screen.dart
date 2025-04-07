import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReportFormScreen extends StatefulWidget {
  @override
  _ReportFormScreenState createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? fechaReporte;

  // Controladores ubicación e información del lugar
  final TextEditingController destinoController = TextEditingController();
  final TextEditingController coloniaController = TextEditingController();
  final TextEditingController comunidadController = TextEditingController();
  final TextEditingController ciudadController = TextEditingController();
  final TextEditingController carreteraController = TextEditingController();
  final TextEditingController kmController = TextEditingController();
  final TextEditingController razonSocialController = TextEditingController();
  final TextEditingController descripcionLugarController =
      TextEditingController();
  final TextEditingController coordenadasNController = TextEditingController();
  final TextEditingController coordenadasWController = TextEditingController();

  // Controladores datos del reporte
  final TextEditingController reportanteController = TextEditingController();

  // Controladores datos de unidad y horarios
  final TextEditingController unidadAtiendeController = TextEditingController();
  final TextEditingController kmSalidaController = TextEditingController();
  final TextEditingController kmLlegadaController = TextEditingController();
  final TextEditingController hrReporteController = TextEditingController();
  final TextEditingController hrSalidaBaseController = TextEditingController();
  final TextEditingController hrArriboController = TextEditingController();
  final TextEditingController hrSalidaEscenaController =
      TextEditingController();
  final TextEditingController hrUnidadDisponibleController =
      TextEditingController();
  final TextEditingController hrLlegadaBaseController = TextEditingController();

  // Controladores tipo de servicio y descripción
  final TextEditingController especificaController = TextEditingController();
  final TextEditingController descripcionServicioController =
      TextEditingController();

  // Controladores reporte de actividades
  final TextEditingController folioAnoController = TextEditingController();
  final TextEditingController folioC4Controller = TextEditingController();
  final TextEditingController elaboraController = TextEditingController();

  // Controladores información complementaria
  final TextEditingController accionesController = TextEditingController();
  final TextEditingController nombreAfectadoController =
      TextEditingController();
  final TextEditingController funcionController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController materialController = TextEditingController();

  // Controladores observaciones
  final TextEditingController observacionesController = TextEditingController();

  // Opciones Dropdowns
  final List<String> guardiaOptions = [
    "Guardia \"A\"",
    "Guardia \"B\"",
    "Guardia \"C\"",
  ];

  final List<String> solicitadoPorOptions = [
    "C-4",
    "Protección Civil",
    "Base Alfa",
    "Ciudadano",
    "Anónimo"
  ];

  final List<String> medioOptions = ["Radio", "Teléfono", "Pié Tierra"];

  final List<String> tipoLlamadaOptions = [
    "Emergencia",
    "Administrativo",
    "Evento Especial"
  ];

  final List<String> operadorOptions = [
    "Miguel Mejia",
    "Alfonso Peru",
    "Abraham Ariza",
    "Alejandro Mejia",
    "Rene Enriquez",
    "José Mejía",
    "Gabriel Trejo",
    "Manuel Peres",
    "Jazael Ruvalcaba",
    "Otro"
  ];

  final List<String> tipoServicioOptions = [
    "Contraincendio",
    "Rescate",
    "Fugas/Derrames",
    "Administrativo",
    "Especial",
    "Cables caídos/Corto circuito",
    "Falsa alarma/Cancelado",
    "Otro"
  ];

  final List<String> ciudadOptions = [
    "Abasolo",
    "Acámbaro",
    "Apaseo el Alto",
    "Apaseo el Grande",
    "Atarjea",
    "Celaya",
    "Comonfort",
    "Coroneo",
    "Cortazar",
    "Cuerámaro",
    "Doctor Mora",
    "Dolores Hidalgo",
    "Guanajuato",
    "Huanímaro",
    "Irapuato",
    "Jaral del Progreso",
    "Jerécuaro",
    "León",
    "Manuel Doblado",
    "Moroleón",
    "Ocampo",
    "Pénjamo",
    "Pueblo Nuevo",
    "Purísima del Rincón",
    "Romita",
    "Salamanca",
    "Salvatierra",
    "San Diego de la Unión",
    "San Felipe",
    "San Francisco del Rincón",
    "San José Iturbide",
    "San Luis de la Paz",
    "Santa Catarina",
    "Santa Cruz de Juventino Rosas",
    "Santiago Maravatío",
    "Silao de la Victoria",
    "Tarandacuao",
    "Tarimoro",
    "Tierra Blanca",
    "Uriangato",
    "Valle de Santiago",
    "Victoria",
    "Villagrán",
    "Xichú",
    "Yuriria"
  ];

  final List<String> unidadOptions = [
    "M-1",
    "M-2",
    "M-7",
    "M-8",
    "M-10",
    "M-12",
    "M-14",
    "M-15",
    "M-16"
  ];

  final List<String> jefeServicioOptions = [
    "Miguel Mejía",
    "Alfonso Perú",
    "Abraham Ariza",
    "Alejandro Mejía",
    "Rene Enriquez",
    "José Mejía",
    "Gabriel Trejo",
    "Manuel Peres",
    "Jazael Ruvalcaba",
    "Miguel Lopez",
    "Aaron Gonzales",
    "Javier Conejo",
    "Manuel Conejo",
    "N/A",
    "Otro"
  ];

  String? solicitadoPor;
  String? jefeServicio;
  String? unidad;
  String? ciudad;
  String? medio;
  String? tipoLlamada;
  String? tipoServicio;
  String? guardia;
  String? operador;
  bool falsaAlarma = false;
  bool cancelado = false;

  Future<void> selectedTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      final formattedTime =
          '${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}';
      controller.text = formattedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nuevo reporte")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Selección de fecha
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      fechaReporte = pickedDate;
                    });
                  }
                },
                child: Text(fechaReporte == null
                    ? "Selecciona la fecha del reporte"
                    : "Fecha: ${fechaReporte!.toLocal().toString().split(' ')[0]}"),
              ),
              SizedBox(height: 40),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Ubicación
              Text("Ubicación", style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: destinoController,
                decoration: InputDecoration(labelText: "Destino/Calle"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: coloniaController,
                decoration: InputDecoration(labelText: "Colonia"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: comunidadController,
                      decoration: InputDecoration(labelText: "Comunidad"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(labelText: "Ciudad"),
                      items: ciudadOptions
                          .map((option) => DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => ciudad = value as String?),
                      validator: (value) =>
                          value == null ? "Campo requerido" : null,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: carreteraController,
                      decoration:
                          InputDecoration(labelText: "Carretera/Camino"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: kmController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: "Kilómetro"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Información del lugar
              Text("Información del lugar",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: razonSocialController,
                decoration:
                    InputDecoration(labelText: "Razón social/Giro comercial"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: descripcionLugarController,
                decoration: InputDecoration(labelText: "Descripción del lugar"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              // Coordenadas
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: coordenadasNController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: "Coordenadas N"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: coordenadasWController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: "Coordenadas W"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Datos del Reporte
              Text("Datos del reporte",
                  style: Theme.of(context).textTheme.titleLarge),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Guardia"),
                items: guardiaOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => guardia = value as String?),
                validator: (value) => value == null ? "Campo requerido" : null,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Solicitado por"),
                items: solicitadoPorOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => solicitadoPor = value as String?),
                validator: (value) => value == null ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: reportanteController,
                decoration: InputDecoration(labelText: "Nombre del reportante"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Medio"),
                items: medioOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => medio = value as String?),
                validator: (value) => value == null ? "Campo requerido" : null,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Tipo de llamada"),
                items: tipoLlamadaOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => tipoLlamada = value as String?),
                validator: (value) => value == null ? "Campo requerido" : null,
              ),
              SizedBox(height: 20),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Datos de la unidad y horarios
              Text("Datos de unidad y horarios",
                  style: Theme.of(context).textTheme.titleLarge),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Unidad que atiende"),
                items: unidadOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => unidad = value as String?),
                validator: (value) => value == null ? "Campo requerido" : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: kmSalidaController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: "Km de salida"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: kmLlegadaController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: "Km de llegada"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: hrReporteController,
                readOnly: true,
                onTap: () => selectedTime(context, hrReporteController),
                decoration: InputDecoration(labelText: "Hora de reporte"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrSalidaBaseController,
                onTap: () => selectedTime(context, hrSalidaBaseController),
                decoration: InputDecoration(labelText: "Hora de salida base"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrArriboController,
                onTap: () => selectedTime(context, hrArriboController),
                decoration: InputDecoration(labelText: "Hora de arribo escena"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrSalidaEscenaController,
                onTap: () => selectedTime(context, hrSalidaEscenaController),
                decoration: InputDecoration(labelText: "Hora de salida escena"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrUnidadDisponibleController,
                onTap: () =>
                    selectedTime(context, hrUnidadDisponibleController),
                decoration:
                    InputDecoration(labelText: "Hora de unidad disponible"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrLlegadaBaseController,
                onTap: () => selectedTime(context, hrLlegadaBaseController),
                decoration: InputDecoration(labelText: "Hora de llegada base"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              SizedBox(height: 20),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Tipo de Servicio
              Text("Tipo de servicio",
                  style: Theme.of(context).textTheme.titleLarge),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Tipo de servicio"),
                items: tipoServicioOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => tipoServicio = value as String?),
                validator: (value) => value == null ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: especificaController,
                decoration: InputDecoration(
                    labelText: "Especifique (en caso de 'Otro')"),
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: Text("Falsa alarma"),
                      value: falsaAlarma,
                      onChanged: (value) {
                        setState(() {
                          falsaAlarma = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: Text("Cancelado"),
                      value: cancelado,
                      onChanged: (value) {
                        setState(() {
                          cancelado = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: descripcionServicioController,
                decoration:
                    InputDecoration(labelText: "Descripción del servicio"),
                maxLines: 3,
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              SizedBox(height: 20),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Reporte de Actividades
              Text("Reporte de actividades",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: folioAnoController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: "Folio del año"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: folioC4Controller,
                decoration: InputDecoration(
                    labelText: "Folio de C4 o NP (NP si no proporcionó Folio)"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: elaboraController,
                decoration: InputDecoration(labelText: "Elabora"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              SizedBox(height: 20),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Información Complementaria
              Text("Información Complementaria",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: accionesController,
                decoration: InputDecoration(
                    labelText:
                        "Acciones en el servicio, material involucrado/área afectada"),
              ),
              TextFormField(
                controller: nombreAfectadoController,
                decoration: InputDecoration(labelText: "Nombre del afectado"),
              ),
              TextFormField(
                controller: funcionController,
                decoration: InputDecoration(labelText: "Función que desempeña"),
              ),
              TextFormField(
                controller: direccionController,
                decoration: InputDecoration(labelText: "Dirección"),
              ),
              TextFormField(
                controller: telefonoController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: "Teléfono"),
              ),
              TextFormField(
                controller: materialController,
                decoration: InputDecoration(
                    labelText: "Material involucrado y daños ocasionados"),
                maxLines: 2,
              ),
              SizedBox(height: 20),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Personal en Servicio
              Text("Personal en servicio",
                  style: Theme.of(context).textTheme.titleLarge),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Operador"),
                items: operadorOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => operador = value as String?),
                validator: (value) => value == null ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: especificaController,
                decoration: InputDecoration(
                    labelText: "Especifique (en caso de 'Otro')"),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Jefe de servicio"),
                items: jefeServicioOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => jefeServicio = value as String?),
                validator: (value) => value == null ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: especificaController,
                decoration: InputDecoration(
                    labelText: "Especifique (en caso de 'Otro')"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Asistente 1"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Asistente 2"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Asistente 3"),
              ),
              SizedBox(height: 20),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Unidades de Bomberos J.R. de Apoyo
              Text("Unidades de Bomberos J.R. de Apoyo",
                  style: Theme.of(context).textTheme.titleLarge),
              for (int i = 1; i <= 4; i++) ...[
                Text("Unidad $i",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(labelText: "Unidad"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Encargado"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "No. de elementos"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(height: 10),
              ],
              SizedBox(height: 20),

              // SECCIÓN: Unidades de Otras Instituciones
              Text("Unidades de otras instituciones",
                  style: Theme.of(context).textTheme.titleLarge),
              for (int i = 1; i <= 3; i++) ...[
                Text("Institución $i",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(labelText: "Institución"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Unidad"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Encargado"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "No. de elementos"),
                ),
                SizedBox(height: 10),
              ],
              SizedBox(height: 20),

//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
              // SECCIÓN: Observaciones y Firma
              Text("Observaciones",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: observacionesController,
                decoration: InputDecoration(labelText: "Observaciones"),
                maxLines: 3,
              ),
              SizedBox(height: 20),

              // Botón Guardar Reporte
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Reporte guardado con éxito")),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Guardar reporte"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
