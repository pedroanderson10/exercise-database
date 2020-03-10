create table eventos (id serial not null, dataa varchar(10), nome varchar (30), cidade varchar(30), atracao varchar (50), primary key (id, dataa, atracao, nome));

create trigger nome_repetidos before insert on eventos for each row execute procedure nome_repetido_func();

create or replace function nome_repetido_func() returns trigger as $$
declare 
	qtd int;
begin 
	select count(*) into qtd from eventos where nome = new.nome;
	if (qtd < 1) then 
		return new;
	else 
		return null;
	end if;
end;
$$ language 'plpgsql';			
