# Route Definitions for the Mock Server\require_relative 'server'\
mock_server = MockServer.new()\
mock_server.get('/mock/:id') do |id|\	get_mock_data('/mock/' + id)\	end\
mock_server.post('/mock') do\	data = JSON.parse(request.body.read)\	add_mock_data('/mock/' + data['id'], data)\	end\
mock_server.run!()
