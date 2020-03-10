create table eventos (id int not null, dataa varchar(10), nome varchar (30), cidade varchar(30), atracao varchar (50), 
primary key (id, dataa, atracao, nome), 
constraint eventos_fkey foreign key (atracao) references atracoes(nome));

create table atracoes (nome varchar(50), descricao varchar(150), constraint atracoes_pkey primary key (nome));


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


create trigger nome_repetidos_atracoes before insert on atracoes for each row execute procedure nome_repetido_atracoes_func();

create or replace function nome_repetido_atracoes_func() returns trigger as $$
declare 
	qtd int;
begin 
	select count(*) into qtd from atracoes where nome = new.nome;
	if (qtd < 1) then 
		return new;
	else 
		return null;
	end if;
end;
$$ language 'plpgsql';				
