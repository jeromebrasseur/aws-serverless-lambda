module.exports.handler = async (event) => {
  console.log('Event: ', event);
  let responseMessage = 'Hello world !';

  return {
    statusCode: 200,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.stringify({
      message: responseMessage,
    }),
  }
}
