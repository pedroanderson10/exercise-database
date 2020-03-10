package main;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Locale; 

import pojo.*;
import dao.*;

public class Main {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		EventosDAO evenDAO = new EventosDAO();

		int option;
		Scanner scanner = new Scanner(System.in);
		scanner.useLocale(Locale.ENGLISH);
		boolean end = false;

		while(!end) {
			System.out.println("----------CADASTRO DE EVENTOS----------");
			System.out.println("| 1 | Cadastrar eventos");
			System.out.println("| 2 | Listar todos os eventos");
			//System.out.println("| 3 | Lista um evento por Data");
			System.out.println("| 3 | Apagar um evento");
			System.out.println("| 4 | Atualizar evento cadastrado");
			System.out.println("| 0 | Sair");

			option = scanner.nextInt();
			scanner.nextLine();
		

			switch (option){
			case 1:{
				int id;
				String dataa, nome, cidade, atracao;
				System.out.println("Digite o id do evento:\n");
				id = scanner.nextInt();
				scanner.nextLine();
				System.out.println("Digite a data do evento:\n");
				dataa = scanner.nextLine();
				System.out.println("Digite o nome do evento:\n");
				nome = scanner.nextLine();
				System.out.println("Digite o local:\n");
				cidade = scanner.nextLine();
				System.out.println("Digite a atracao:\n");
				atracao = scanner.nextLine();
				
				Eventos eventos = new Eventos(id, dataa, nome, cidade, atracao);
				if(evenDAO.addEventos(eventos)) {
					System.out.println(eventos.toString());
					System.out.println("Inserido com sucesso!");
				}else {
					System.err.println("Erro ao inserir evento.");
				}
				break;
			
			}case 2:{
				System.out.println("-----EVENTOS DISPONÍVEIS-----");
				ArrayList<Eventos> eventosList = evenDAO.getListEventos();
				for(Eventos eventos : eventosList){
					System.out.println(eventos.toString());
				}
				break;
			
			}/*case 3:{
				System.out.println("Digite o dia do evento que deseja pesquisar:");
				String dataa = scanner.nextLine();
				
				ArrayList<Eventos> eventosList = evenDAO.busca(dataa);
				for(Eventos eventos : eventosList){
					System.out.println(eventos.toString());
				}
				break;
				
				/*ArrayList<Eventos> resultado = evenDAO.getListEventos();
					for(Iterator<Eventos> iterator = resultado.iterator(); iterator.hasNext();){
					Eventos e = iterator.next();
					System.out.println("Evento Encontrado: " + e.toString());
				}
				break;
				
			} */
			case 3:{
				System.out.println("Digite o id do evento que deseja apagar:");
				int id = scanner.nextInt();
				if(evenDAO.deleteEventos(id)) {
					
				}else {
					System.err.println("Erro ao deletar evento.");
				}
				break;
			}case 4:{			
				int id;
				String dataa, nome, cidade, atracao;
				System.out.println("Digite o id do evento que deseja alterar:");
				id = scanner.nextInt();
				scanner.nextLine();
				
				System.out.println("Digite a data do evento:\n");
				dataa = scanner.nextLine();
				System.out.println("Digite o nome do evento:\n");
				nome = scanner.nextLine();
				System.out.println("Digite o local:\n");
				cidade = scanner.nextLine();
				System.out.println("Digite a atracao:\n");
				atracao = scanner.nextLine();

				
				Eventos eventos = new Eventos(id, dataa, nome, cidade, atracao);
				if(evenDAO.altera(eventos)) {
					System.out.println("Atualizado com sucesso!");
				}else {
					System.err.println("Erro ao atualizar evento.");
				}
				break;
			}
			default:
				end = true;
				break;
			}
		}
	}

}
