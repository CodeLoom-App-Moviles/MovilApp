import 'package:code_loom_app/solicitud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentView extends StatefulWidget {
  final String serviceId;

  PaymentView({required this.serviceId});

  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _amountController = TextEditingController();
  String _selectedPaymentMethod = 'Visa'; // Default selected payment method
  bool _isProcessing = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardHolderNameController.dispose();
    _amountController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _selectPaymentMethod(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  void _updatePaymentMethod(String cardNumber) {
    if (cardNumber.startsWith('4')) {
      _selectPaymentMethod('Visa');
    } else if (cardNumber.startsWith('5')) {
      _selectPaymentMethod('Mastercard');
    }
  }

  Future<void> _processPayment() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
      });
      _animationController.forward().then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pago confirmado!')),
        );
        _animationController.reverse();
        setState(() {
          _isProcessing = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SolicitudView(softwareId: widget.serviceId)),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Métodos de pago', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: Text('Ver todos')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _selectPaymentMethod('Visa'),
                    child: Image.asset('assets/img/Visa.jpg', height: 50),
                  ),
                  GestureDetector(
                    onTap: () => _selectPaymentMethod('Mastercard'),
                    child: Image.asset('assets/img/Mastercard.jpg', height: 50),
                  ),
                  GestureDetector(
                    onTap: () => _selectPaymentMethod('Efectivo'),
                    child: Image.asset('assets/img/Efectivo.jpg', height: 50),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Tus datos de pago', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              if (_selectedPaymentMethod != 'Efectivo') ...[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _cardHolderNameController,
                        decoration: InputDecoration(
                          labelText: 'Titular de la tarjeta',
                          hintText: 'Ej. Rodolfo Rivera',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el nombre del titular';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _cardNumberController,
                        decoration: InputDecoration(
                          labelText: 'Número de la tarjeta',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el número de tarjeta';
                          }
                          return null;
                        },
                        onChanged: _updatePaymentMethod,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              controller: _expiryDateController,
                              decoration: InputDecoration(
                                labelText: 'Fecha de vencimiento',
                                hintText: 'MM/YY',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese la fecha de vencimiento';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _cvvController,
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                hintText: 'Ej. 123',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese el CVV';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      CheckboxListTile(
                        title: Text('Guardar datos para futuras compras'),
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
              if (_selectedPaymentMethod == 'Efectivo')
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Monto a pagar',
                          hintText: 'Ej. 100',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el monto';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ElevatedButton.icon(
                onPressed: _isProcessing ? null : _processPayment,
                icon: Icon(Icons.lock),
                label: Text('Pagar'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizeTransition(
                sizeFactor: _animation,
                axisAlignment: -1.0,
                child: _isProcessing
                    ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Procesando el pago...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
