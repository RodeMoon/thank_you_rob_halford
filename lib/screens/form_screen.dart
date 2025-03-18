import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReportFormScreen extends StatefulWidget {
  @override
  _ReportFormScreenState createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? fechaReporte;

  // Controladores para campos de Ubicación e Información del Lugar
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

  // Controladores para Datos del Reporte
  final TextEditingController reportanteController = TextEditingController();

  // Controladores para Datos de Unidad y Horarios
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

  // Controladores para Tipo de Servicio y descripción
  final TextEditingController especificaController = TextEditingController();
  final TextEditingController descripcionServicioController =
      TextEditingController();

  // Controladores para Reporte de Actividades
  final TextEditingController folioController = TextEditingController();
  final TextEditingController elaboraController = TextEditingController();

  // Controladores para Información Complementaria
  final TextEditingController nombreAfectadoController =
      TextEditingController();
  final TextEditingController funcionController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController materialController = TextEditingController();

  // Controladores para Observaciones y Firma
  final TextEditingController observacionesController = TextEditingController();
  final TextEditingController firmaController = TextEditingController();

  // Opciones para Dropdowns
  final List<String> solicitadoPorOptions = [
    "C-4",
    "Protección Civil",
    "Base Alfa",
    "Ciudadano"
  ];
  final List<String> medioOptions = ["Radio", "Teléfono", "Pié Tierra"];
  final List<String> tipoLlamadaOptions = [
    "Emergencia",
    "Administrativo",
    "Evento Especial"
  ];
  final List<String> tipoServicioOptions = [
    "Contraincendio",
    "Rescate",
    "Fugas/Derrames",
    "Administrativo",
    "Especial",
    "Otro"
  ];

  String? solicitadoPor;
  String? medio;
  String? tipoLlamada;
  String? tipoServicio;
  bool falsaAlarma = false;
  bool cancelado = false;

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
              // Selección de Fecha
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
              SizedBox(height: 20),

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
                    child: TextFormField(
                      controller: ciudadController,
                      decoration: InputDecoration(labelText: "Ciudad"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
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
                      decoration: InputDecoration(labelText: "Km"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // SECCIÓN: Información del Lugar
              Text("Información del Lugar",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: razonSocialController,
                decoration:
                    InputDecoration(labelText: "Razón Social/Giro Comercial"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: descripcionLugarController,
                decoration: InputDecoration(labelText: "Descripción del Lugar"),
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

              // SECCIÓN: Datos del Reporte
              Text("Datos del Reporte",
                  style: Theme.of(context).textTheme.titleLarge),
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
                decoration: InputDecoration(labelText: "Nombre del Reportante"),
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
                decoration: InputDecoration(labelText: "Tipo de Llamada"),
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

              // SECCIÓN: Datos de Unidad y Horarios
              Text("Datos de Unidad y Horarios",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: unidadAtiendeController,
                decoration: InputDecoration(labelText: "Unidad que Atiende"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: kmSalidaController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: "Km de Salida"),
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
                      decoration: InputDecoration(labelText: "Km de Llegada"),
                      validator: (value) =>
                          value!.isEmpty ? "Campo requerido" : null,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: hrReporteController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: "Hr Reporte"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrSalidaBaseController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: "Hr Salida de Base"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrArriboController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: "Hr Arribo a Escena"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrSalidaEscenaController,
                decoration: InputDecoration(labelText: "Hr Salida de Escena"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrUnidadDisponibleController,
                decoration: InputDecoration(labelText: "Hr Unidad Disponible"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: hrLlegadaBaseController,
                decoration: InputDecoration(labelText: "Hr Llegada a Base"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              SizedBox(height: 20),

              // SECCIÓN: Tipo de Servicio
              Text("Tipo de Servicio",
                  style: Theme.of(context).textTheme.titleLarge),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Tipo de Servicio"),
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
                      title: Text("Falsa Alarma"),
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
                    InputDecoration(labelText: "Descripción del Servicio"),
                maxLines: 3,
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              SizedBox(height: 20),

              // SECCIÓN: Reporte de Actividades
              Text("Reporte de Actividades",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: folioController,
                decoration: InputDecoration(labelText: "Folio"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: elaboraController,
                decoration: InputDecoration(labelText: "Elabora"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              SizedBox(height: 20),

              // SECCIÓN: Información Complementaria
              Text("Información Complementaria",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: nombreAfectadoController,
                decoration: InputDecoration(labelText: "Nombre del Afectado"),
              ),
              TextFormField(
                controller: funcionController,
                decoration: InputDecoration(labelText: "Función que Desempeña"),
              ),
              TextFormField(
                controller: direccionController,
                decoration: InputDecoration(labelText: "Dirección"),
              ),
              TextFormField(
                controller: telefonoController,
                decoration: InputDecoration(labelText: "Teléfono"),
              ),
              TextFormField(
                controller: materialController,
                decoration: InputDecoration(
                    labelText: "Material Involucrado y Daños Ocasionados"),
                maxLines: 2,
              ),
              SizedBox(height: 20),

              // SECCIÓN: Personal en Servicio
              Text("Personal en Servicio",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                decoration: InputDecoration(labelText: "Operador"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Jefe de Servicio"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
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

              // SECCIÓN: Unidades de Bomberos J.R. de Apoyo
              Text("Unidades de Bomberos J.R. de Apoyo",
                  style: Theme.of(context).textTheme.titleLarge),
              for (int i = 1; i <= 4; i++) ...[
                Text("Unidad $i",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(labelText: "Unidad"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Encargado"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "No. de Elementos"),
                ),
                SizedBox(height: 10),
              ],
              SizedBox(height: 20),

              // SECCIÓN: Unidades de Otras Instituciones
              Text("Unidades de Otras Instituciones",
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
                  decoration: InputDecoration(labelText: "No. de Elementos"),
                ),
                SizedBox(height: 10),
              ],
              SizedBox(height: 20),

              // SECCIÓN: Observaciones y Firma
              Text("Observaciones",
                  style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                controller: observacionesController,
                decoration: InputDecoration(labelText: "Observaciones"),
                maxLines: 3,
              ),
              TextFormField(
                controller: firmaController,
                decoration:
                    InputDecoration(labelText: "Firma de Jefe de Guardia"),
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
                  child: Text("Guardar Reporte"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
