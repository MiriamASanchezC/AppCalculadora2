//
//  AppDelegate.m
//  AppCalculadora2
//
//  Created by Miriam Sanchez on 11/02/25.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property(nonatomic,strong) NSMutableString* currentInput;
@property(nonatomic,assign) double result;
@property(nonatomic,assign) char operation;
@property(nonatomic, assign) double memory;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.currentInput = [NSMutableString string];
    self.result=0;
    self.operation=' ';
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


- (IBAction)clear:(id)sender {
    // Limpiar todos los valores y operaciones pendientes
        [self.currentInput setString:@""];
        self.result = 0;
        self.memory = 0;
        self.operation = ' ';
        
        // Mostrar '0' en pantalla
        self.display.stringValue = @"0";
        
        NSLog(@"Calculadora restablecida");
}

- (IBAction)pressMemoryAdd:(id)sender {
    double value = [self.display.stringValue doubleValue];
        
        // Sumar el valor actual al valor en memoria
        self.memory += value;
        
        NSLog(@"Nuevo valor en memoria: %g", self.memory);
}

- (IBAction)pressMemoryRecall:(id)sender {
    // Si hay un valor almacenado en memoria, mostrarlo
        self.display.stringValue = [NSString stringWithFormat:@"%g", self.memory];
        
        // También actualizar el valor actual para que se pueda operar sobre él
        [self.currentInput setString:[NSString stringWithFormat:@"%g", self.memory]];
}

- (IBAction)pressMemoryStore:(id)sender {
    self.memory = [self.display.stringValue doubleValue];
        NSLog(@"Valor almacenado en memoria: %g", self.memory);
}

- (IBAction)pressCos:(id)sender {
    double value = [self.currentInput doubleValue];
    // Convertir grados a radianes
        double radians = value * (M_PI / 180);
    
    double result = cos(radians);
    self.display.stringValue = [NSString stringWithFormat:@"%g", result];
    self.result = result;
    [self.currentInput setString:@""];
}

- (IBAction)pressSin:(id)sender {
    double value = [self.currentInput doubleValue];
    // Convertir grados a radianes
        double radians = value * (M_PI / 180);
    
    double result = sin(radians);
    self.display.stringValue = [NSString stringWithFormat:@"%g", result];
    self.result = result;
    [self.currentInput setString:@""];
}

- (IBAction)pressSqrt:(id)sender {
    double value = [self.currentInput doubleValue];
    
    double result = sqrt(value);
    
    self.display.stringValue = [NSString stringWithFormat:@"%g", result];
    self.result = result;
    [self.currentInput setString:@""];
}

- (IBAction)pressInverse:(id)sender {
    double value = [self.currentInput doubleValue];
    
    if (value == 0){
        //Si el valor es cero, mostrar mensaje de error
        self.display.stringValue = @"Error";
        [self.currentInput setString:@""];
        return;
    }
    
    //Calcular el inverso
    double result = 1.0 / value;
    
    //Mostramos el resultado
    self.display.stringValue = [NSString stringWithFormat:@"%g", result];
    
    // Actualizar el valor de resultado y limpiar el valor actual
        self.result = result;
        [self.currentInput setString:@""];
}

- (IBAction)pressDigit:(id)sender {
    NSString* digit = [sender title];
    
    //Vamos a validar los que los flotantes ingresados sean correctos
    if([digit isEqualToString:@"."]){
        //Si el valor actual ya contiene un punto, ignorar el segundo punto
        if([self.currentInput containsString:@"."]){
            return;
        }
        //Si el primer caracter es un punto agregar "0."
        if(self.currentInput.length == 0){
            [self.currentInput appendString:@"0"];
            
        }
    }
    
    [self.currentInput appendString:digit];
    self.display.stringValue = self.currentInput;
}

- (IBAction)pressOp:(id)sender {
    if(self.currentInput.length>0){
        self.result = [self.currentInput doubleValue];
        [self.currentInput setString:@""];
    }
    self.operation = [[sender title] characterAtIndex:0];
}

- (IBAction)pressEqual:(id)sender {
    double secondNumber = [self.currentInput doubleValue];
    switch (self.operation) {
        case '+':
            self.result += secondNumber;
            break;
        case '-':
            self.result -= secondNumber;
            break;
        case 'x':
            self.result *= secondNumber;
            break;
        case '/':
            self.result /= secondNumber;
            break;
        
    }
    self.display.stringValue = [NSString stringWithFormat:@"%g", self.result];
    [self.currentInput setString:@""];
}
@end
