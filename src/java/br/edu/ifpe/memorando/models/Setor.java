/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpe.memorando.models;

/**
 *
 * @author casa01
 */
public class Setor {
    
    private int id;
    private String sigla;
    private String senha;
    private String numeroMemorando;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the sigla
     */
    public String getSigla() {
        return sigla;
    }

    /**
     * @param sigla the sigla to set
     */
    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the numeroMemorando
     */
    public String getNumeroMemorando() {
        return numeroMemorando;
    }

    /**
     * @param numeroMemorando the numeroMemorando to set
     */
    public void setNumeroMemorando(String numeroMemorando) {
        this.numeroMemorando = numeroMemorando;
    }
    
}
