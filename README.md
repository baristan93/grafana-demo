docker-compose up -d (you will have to repeat once or twice because app container depends on FluentBit)

docker-compose ps to check if all containers are running

you can check Grafana at http://localhost:3000 (admin/admin)

run curl http://localhost:8080/rolldice to generate a couple of requests.

Tempo and Loki data will be available in the Grafana. Just go to http://localhost:3000/explore, and set the datasource Loki. 

set label filter job = fluentbit and run the query.

find in logs trace_idand copy it 

set datasource to Tempo, and paste copied trace_id
