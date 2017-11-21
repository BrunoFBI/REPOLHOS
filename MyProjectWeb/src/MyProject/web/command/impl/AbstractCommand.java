package MyProject.web.command.impl;

import MyProject.impl.controle.Fachada;
import MyProject.web.command.ICommand;
import MyProjectCore.IFachada;

public abstract class AbstractCommand implements ICommand{
	protected IFachada fachada = new Fachada();

}
