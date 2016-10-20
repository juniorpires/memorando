/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpe.memorando.db;

import br.edu.ifpe.memorando.models.Memorando;
import br.edu.ifpe.memorando.models.Setor;
import com.db4o.ObjectContainer;
import com.db4o.query.Query;

/**
 *
 * @author casa01
 */
public class MemorandoDao extends GenericDb4oDAO<Memorando>{

    @Override
    protected Query getQueryToUniqueObject(Memorando model, ObjectContainer db) {
        Query query = db.query();
		query.constrain(Setor.class);
		query.descend("numero").constrain(model.getNumero());

		return query;
    }
    
}
