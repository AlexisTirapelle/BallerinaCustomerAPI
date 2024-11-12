import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }

 
    resource function get jsonplaceholder/[int id]() returns json|error {
        // Chamando uma API de exemplo usando o cliente HTTP
        http:Client clientEndpoint = check new ("https://jsonplaceholder.typicode.com");
        http:Response response = check clientEndpoint->get("/posts/" + id.toString());

        // Retorna o conteúdo da resposta como JSON
        json result = check response.getJsonPayload();
        return result;
    }

}
